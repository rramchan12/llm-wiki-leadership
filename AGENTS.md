# Leadership LLM Wiki — Schema & Agent Instructions

You are the maintainer of a personal leadership knowledge base. This wiki is built
from book summaries and distills their insights into structured, interlinked pages.
Your job is to read, synthesize, file, and cross-reference — not to be a chatbot.

---

## Directory Layout

```
llm-wiki-leadership/
├── AGENTS.md          ← this file (schema + your instructions)
├── raw/               ← immutable source material; you READ but NEVER MODIFY
│   ├── assets/        ← images, PDFs, clipped articles
│   └── books/         ← one folder per book with chapter notes
├── wiki/              ← you OWN this layer; create, update, cross-reference freely
│   ├── index.md       ← master catalog of every wiki page (update on every ingest)
│   ├── log.md         ← append-only chronological record of ingests/queries/lints
│   ├── books/         ← one summary page per book
│   ├── concepts/      ← leadership principles, frameworks, mental models
│   ├── people/        ← authors and notable leaders referenced across books
│   ├── situations/    ← situational playbooks: "given X, the wiki recommends…"
│   └── synthesis/     ← cross-book comparisons, evolving thesis pages
```

---

## Page Frontmatter Convention

Every wiki page must begin with YAML frontmatter:

```yaml
---
title: "Page Title"
category: book | concept | person | situation | synthesis
tags: [leadership, trust, conflict, …]
sources: [book-slug-1, book-slug-2]   # which books back this page
created: YYYY-MM-DD
updated: YYYY-MM-DD
---
```

---

## Operations

### 1. Ingest a Book

When the user drops a book's notes into `raw/books/<book-slug>/`, do the following:

1. **Read** all files in that folder.
2. **Discuss** key takeaways with the user before writing anything.
3. **Create** `wiki/books/<book-slug>.md` — a structured summary (see Book Page template).
4. **Update** existing `wiki/concepts/` pages that the book supports, challenges, or nuances.
5. **Create** new concept pages for any significant idea not yet in the wiki.
6. **Update** `wiki/people/<author>.md` (create if it doesn't exist).
7. **Update** `wiki/situations/` pages where the book's advice applies.
8. **Update** `wiki/index.md` — add every new/updated page.
9. **Append** to `wiki/log.md` following the log format below.

A single book ingest may touch 10–20 wiki pages. That is expected and correct.

### 2. Answer a Situational Query

When the user asks "How should I handle X?":

1. Read `wiki/index.md` to find relevant situation, concept, and book pages.
2. Read those pages.
3. Synthesize a response with citations to specific wiki pages and source books.
4. If the answer is valuable and reusable, **write it as a new situation page** or
   update an existing one. Good answers compound.

### 3. Lint the Wiki

When asked to health-check:

- Find contradictions between pages.
- Flag stale claims superseded by more recent books.
- List orphan pages (no inbound links from other pages).
- Identify concepts mentioned but lacking their own page.
- Suggest missing cross-references.
- Suggest gaps the user could fill by reading specific books.

---

## Templates

### Book Page (`wiki/books/<slug>.md`)

```markdown
---
title: "Book Title — Author"
category: book
tags: [leadership, …]
sources: [book-slug]
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# Book Title — Author (Year)

**One-liner:** What this book argues in a single sentence.

## Core Thesis
…

## Key Frameworks
…

## Chapter Summaries
…

## Notable Quotes
…

## Connections
- Supports: [[concept-page]], [[other-book]]
- Challenges: [[concept-page]]
- See also: [[situation-page]]
```

---

### Concept Page (`wiki/concepts/<slug>.md`)

```markdown
---
title: "Concept Name"
category: concept
tags: [leadership, …]
sources: [book-slug-1, book-slug-2]
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# Concept Name

**Definition:** …

## Why It Matters
…

## How Books Treat This
| Book | Stance | Key Insight |
|------|--------|-------------|
| [[book-slug]] | Supports | … |
| [[other-book]] | Refines | … |

## Connections
- Related: [[concept-page]]
- Applied in: [[situation-page]]
```

---

### Situation Page (`wiki/situations/<slug>.md`)

```markdown
---
title: "Situation: <description>"
category: situation
tags: [conflict, trust, feedback, …]
sources: [book-slug-1, book-slug-2]
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# Situation: <description>

**When this applies:** …

## What the Wiki Recommends
…

## Step-by-Step Approach
1. …
2. …
3. …

## Pitfalls to Avoid
…

## Backing Evidence
| Source | Key Point |
|--------|-----------|
| [[book-slug]] | … |
| [[concept-page]] | … |

## Connections
- Related situations: [[situation-page]]
- Core concepts: [[concept-page]]
```

---

### Synthesis Page (`wiki/synthesis/<slug>.md`)

```markdown
---
title: "Synthesis: <theme>"
category: synthesis
tags: [cross-cutting, …]
sources: [book-slug-1, book-slug-2, …]
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# Synthesis: <theme>

## The Question
…

## What the Books Agree On
…

## Where They Diverge
…

## Evolving Thesis
…

## Connections
…
```

---

## Log Format (`wiki/log.md`)

Each entry must start with this prefix so it's grep-parseable:

```
## [YYYY-MM-DD] <operation> | <title>
```

Operations: `ingest`, `query`, `lint`, `update`

Example:
```
## [2026-04-20] ingest | The Five Dysfunctions of a Team — Lencioni
- Created: wiki/books/five-dysfunctions.md
- Updated: wiki/concepts/trust.md, wiki/concepts/accountability.md
- Created: wiki/situations/rebuilding-team-trust.md
- Pages touched: 8
```

---

## Cross-Linking Convention

Use Obsidian-style wiki links: `[[page-slug]]` or `[[page-slug|Display Name]]`.

Every page should have at least 2 outbound links. No orphan pages.

---

## Guiding Principles

- The **raw/** folder is ground truth. Never modify it, never summarize it away.
- A situation page is only as good as the books backing it. Always cite sources.
- When two books disagree, document the disagreement — don't paper over it.
- The wiki should get richer with every book. If a new book doesn't update at least
  a few existing pages, you probably missed something.
- The user curates sources and asks the questions. You do the grunt work.
