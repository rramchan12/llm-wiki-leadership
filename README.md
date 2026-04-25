# Leadership LLM Wiki

A personal knowledge base that distills leadership and personal-effectiveness books
into structured, interlinked wiki pages — maintained by an LLM agent.

Inspired by [Andrej Karpathy's idea](https://x.com/karpathy/status/1908192250988953922)
of using LLMs as long-running knowledge workers: instead of one-shot Q&A,
the agent reads source material, synthesizes it, files it into a growing wiki,
and cross-references new insights against everything it already knows.
Each book ingested makes every other page richer.

## How It Works

```
raw/books/<slug>/notes.md   →   LLM reads, synthesizes   →   wiki/ pages created & cross-linked
     (you curate)                   (agent does)                  (agent maintains)
```

1. **You** drop book notes into `raw/books/<book-slug>/`.
2. **The agent** reads them, creates a book summary, updates concept/people/situation pages, and wires everything together.
3. **You** ask situational questions ("How should I handle X?"). The agent synthesizes across all ingested books and cites its sources.
4. **The wiki compounds.** Every new book updates existing pages — agreements, tensions, and nuances accumulate.

## What's Inside

| Folder | Contents |
|--------|----------|
| `raw/` | Immutable source material — book notes, articles, assets. Never modified by the agent. |
| `wiki/books/` | One structured summary per book (thesis, frameworks, chapter summaries, quotes, connections). |
| `wiki/concepts/` | Leadership principles, frameworks, mental models — cross-referenced across books. |
| `wiki/people/` | Authors and notable figures referenced across the wiki. |
| `wiki/situations/` | Actionable playbooks: "Given X, the wiki recommends…" with citations. |
| `wiki/synthesis/` | Cross-book comparisons and evolving thesis pages. |
| `wiki/index.md` | Master catalog of every page. Start here. |
| `wiki/log.md` | Chronological record of all ingests and updates. |
| `AGENTS.md` | Agent schema, templates, and operating instructions. |

## Current Library (18 books)

**CBT / Mood / Mental Health** — Feeling Good (Burns), The Happiness Trap (Harris), Unwinding Anxiety (Brewer)

**Flow & Peak Performance** — The Art of Impossible (Kotler), Gnar Country (Kotler), Rise of Superman (Kotler), Finding Flow (Csikszentmihalyi)

**Decision-Making & Change** — Decisive (Heath & Heath), Switch (Heath & Heath), Made to Stick (Heath & Heath), The Power of Moments (Heath & Heath)

**Leadership Transitions** — The First 90 Days (Watkins)

**Conflict, Relationships & Mindset** — Leadership and Self-Deception (Arbinger), The Anatomy of Peace (Arbinger), The Outward Mindset (Arbinger)

**Communication & Feedback** — Crucial Conversations (Patterson et al.), Radical Candor (Scott)

**Stoic Leadership** — The Stoic Leader (Sellars & Stead)

→ See [wiki/index.md](wiki/index.md) for the full page catalog (74 pages across books, concepts, people, situations, and synthesis).

## Playwright MCP Integration

This repo includes a workspace-level MCP server configuration in
`.vscode/settings.json` so Copilot Chat can use browser automation tools.

### Included Server

- `playwright` via `@executeautomation/playwright-mcp-server`

### Prerequisites

1. Install Node.js (includes `npx`).
2. Use VS Code with GitHub Copilot Chat enabled.

### How To Use

1. Reload the VS Code window after pulling the repo.
2. In Copilot Chat (agent mode), ask for a browser task, for example:
     `Use the playwright MCP server to open https://example.com and return the page title.`

### Notes

- Public pages work best; authenticated/paywalled sites may block automation.
- Keep MCP configuration limited to trusted servers.
