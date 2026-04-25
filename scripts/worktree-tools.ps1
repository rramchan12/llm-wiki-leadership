# Copy into your PowerShell profile (or run once in a terminal session).
# Creates a git worktree, opens it in a new VS Code window, and optionally starts a background watcher.

function New-WorktreeSession {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Task,                         # ex: "docs-links" -> branch feature/docs-links

        [string]$BaseBranch = "main",
        [string]$BranchPrefix = "feature/",
        [string]$WatcherCommand = "",          # ex: "npm test -- --watch" or "pytest -f"
        [string]$RepoRoot = (Get-Location).Path
    )

    $ErrorActionPreference = "Stop"

    # Validate repo
    Push-Location $RepoRoot
    try {
        git rev-parse --is-inside-work-tree 1>$null 2>$null
        if ($LASTEXITCODE -ne 0) {
            throw "Not a git repository: $RepoRoot"
        }

        $repoName = Split-Path -Leaf (Resolve-Path .)
        $parentDir = Split-Path -Parent (Resolve-Path .)

        # Make branch/path names safe
        $safeTask = ($Task.Trim().ToLower() -replace "[^a-z0-9._-]+","-").Trim("-")
        if ([string]::IsNullOrWhiteSpace($safeTask)) {
            throw "Task name became empty after sanitization."
        }

        $branchName = "$BranchPrefix$safeTask"
        $worktreePath = Join-Path $parentDir "$repoName-$safeTask"

        # Keep refs fresh
        git fetch --all --prune

        # Create worktree (new branch or existing branch)
        git show-ref --verify --quiet "refs/heads/$branchName"
        if ($LASTEXITCODE -eq 0) {
            git worktree add "$worktreePath" "$branchName"
        } else {
            git worktree add "$worktreePath" -b "$branchName" "$BaseBranch"
        }

        # Open in new VS Code window
        code -n "$worktreePath"

        # Start watcher in background if provided
        if (-not [string]::IsNullOrWhiteSpace($WatcherCommand)) {
            $escapedPath = $worktreePath -replace "'", "''"
            $runner = "Set-Location -LiteralPath '$escapedPath'; $WatcherCommand"
            $proc = Start-Process pwsh `
                -ArgumentList @("-NoExit","-Command",$runner) `
                -WorkingDirectory "$worktreePath" `
                -WindowStyle Normal `
                -PassThru

            Write-Host "Watcher started (PID $($proc.Id)) in $worktreePath"
        }

        Write-Host "Worktree ready:"
        Write-Host "  Branch:   $branchName"
        Write-Host "  Path:     $worktreePath"
        Write-Host "  Opened:   VS Code new window"
    }
    finally {
        Pop-Location
    }
}

# Optional short alias:
Set-Alias nwt New-WorktreeSession


# Removes a git worktree and optionally deletes its local branch.
# Pair this with New-WorktreeSession / nwt.

function Remove-WorktreeSession {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Task,                        # ex: "docs-links"

        [string]$BranchPrefix = "feature/",
        [string]$RepoRoot = (Get-Location).Path,

        [switch]$DeleteBranch,                # also delete local branch
        [switch]$Force,                       # force remove dirty worktree / force branch delete
        [switch]$Prune                         # run `git worktree prune` after removal
    )

    $ErrorActionPreference = "Stop"

    Push-Location $RepoRoot
    try {
        git rev-parse --is-inside-work-tree 1>$null 2>$null
        if ($LASTEXITCODE -ne 0) {
            throw "Not a git repository: $RepoRoot"
        }

        $repoName = Split-Path -Leaf (Resolve-Path .)
        $parentDir = Split-Path -Parent (Resolve-Path .)

        $safeTask = ($Task.Trim().ToLower() -replace "[^a-z0-9._-]+","-").Trim("-")
        if ([string]::IsNullOrWhiteSpace($safeTask)) {
            throw "Task name became empty after sanitization."
        }

        $branchName = "$BranchPrefix$safeTask"
        $worktreePath = Join-Path $parentDir "$repoName-$safeTask"

        if (-not (Test-Path -LiteralPath $worktreePath)) {
            throw "Worktree path not found: $worktreePath"
        }

        # Remove worktree first
        $removeArgs = @("worktree", "remove")
        if ($Force) { $removeArgs += "--force" }
        $removeArgs += "$worktreePath"

        if ($PSCmdlet.ShouldProcess($worktreePath, "git $($removeArgs -join ' ')")) {
            & git @removeArgs
            if ($LASTEXITCODE -ne 0) {
                throw "Failed to remove worktree: $worktreePath"
            }
        }

        # Optionally delete local branch
        if ($DeleteBranch) {
            git show-ref --verify --quiet "refs/heads/$branchName"
            if ($LASTEXITCODE -eq 0) {
                $branchArgs = @("branch")
                if ($Force) { $branchArgs += "-D" } else { $branchArgs += "-d" }
                $branchArgs += "$branchName"

                if ($PSCmdlet.ShouldProcess($branchName, "git $($branchArgs -join ' ')")) {
                    & git @branchArgs
                    if ($LASTEXITCODE -ne 0) {
                        throw "Failed to delete branch: $branchName"
                    }
                }
            } else {
                Write-Warning "Local branch not found, skipping delete: $branchName"
            }
        }

        if ($Prune) {
            git worktree prune
        }

        Write-Host "Removed worktree session:"
        Write-Host "  Path:   $worktreePath"
        if ($DeleteBranch) { Write-Host "  Branch: $branchName (delete requested)" }
    }
    finally {
        Pop-Location
    }
}

# Optional short alias:
Set-Alias rwt Remove-WorktreeSession


# Lists git worktrees for the repository in a readable table.
function Get-WorktreeSessions {
    [CmdletBinding()]
    param(
        [string]$RepoRoot = (Get-Location).Path
    )

    $ErrorActionPreference = "Stop"

    Push-Location $RepoRoot
    try {
        git rev-parse --is-inside-work-tree 1>$null 2>$null
        if ($LASTEXITCODE -ne 0) {
            throw "Not a git repository: $RepoRoot"
        }

        $lines = git worktree list --porcelain
        $rows = @()
        $current = @{}

        foreach ($line in $lines) {
            if ($line -match "^worktree\s+(.+)$") {
                if ($current.Count -gt 0) {
                    $rows += [PSCustomObject]@{
                        Path   = $current.Path
                        Branch = $current.Branch
                        Commit = $current.Commit
                        Bare   = [bool]$current.Bare
                        Locked = [bool]$current.Locked
                        Prunable = [bool]$current.Prunable
                    }
                }

                $current = @{
                    Path = $matches[1]
                    Branch = ""
                    Commit = ""
                    Bare = $false
                    Locked = $false
                    Prunable = $false
                }
                continue
            }

            if ($line -match "^HEAD\s+([0-9a-fA-F]+)$") {
                $current.Commit = $matches[1].Substring(0, [Math]::Min(10, $matches[1].Length))
                continue
            }

            if ($line -match "^branch\s+refs/heads/(.+)$") {
                $current.Branch = $matches[1]
                continue
            }

            if ($line -eq "bare") {
                $current.Bare = $true
                continue
            }

            if ($line -eq "locked") {
                $current.Locked = $true
                continue
            }

            if ($line -like "prunable*") {
                $current.Prunable = $true
                continue
            }
        }

        if ($current.Count -gt 0) {
            $rows += [PSCustomObject]@{
                Path   = $current.Path
                Branch = $current.Branch
                Commit = $current.Commit
                Bare   = [bool]$current.Bare
                Locked = [bool]$current.Locked
                Prunable = [bool]$current.Prunable
            }
        }

        if ($rows.Count -eq 0) {
            Write-Host "No worktrees found."
            return
        }

        $rows | Sort-Object Path | Format-Table -AutoSize
    }
    finally {
        Pop-Location
    }
}

# Optional short alias:
Set-Alias gwt Get-WorktreeSessions


# Usage examples:
#   . .\scripts\worktree-tools.ps1
#   nwt -Task "docs-update"
#   nwt -Task "parser-fix" -WatcherCommand "pytest -f"
#   nwt -Task "ui-refactor" -WatcherCommand "npm test -- --watch"
#   gwt
#   rwt -Task "docs-update"
#   rwt -Task "docs-update" -DeleteBranch -Prune