# Wiki Synthesis Plan — Parallel Worktree Execution

> Created: 2026-04-25  
> Purpose: Structured prompts for batch-parallel wiki ingestion across worktrees.

---

## Current State (as of 2026-04-25)

| Batch | Books | Status |
|-------|-------|--------|
| Batch 0 | The Stoic Leader | ✅ Complete |
| Batch 1 | Outward Mindset, Switch, Made to Stick, Power of Moments, Rise of Superman, Finding Flow, Radical Candor, Crucial Conversations | ✅ Complete |
| Batch 2 | What Got You Here, 7 Habits, One Minute Manager, One Minute Mentoring, Peopleware, The Goal, Humble Inquiry, Eat That Frog | ⬜ Pending |
| Batch 3 | Making Numbers Count, Working Backwards, Behave, Extreme Ownership, Deep Work, Antifragile, Principles | ⬜ Pending |
| Batch 4 | Man's Search for Meaning, Letters from a Stoic, Meditations, Die With Zero, Almanack of Naval Ravikant | ⬜ Pending |

**Wiki baseline** (do not duplicate):
- 18 book pages, 33 concept pages, 14 people pages, 8 situation pages, 1 synthesis page
- See `wiki/index.md` for the full current catalog before touching any existing page.

---

## Worktree Strategy & Merge Notes

Run Batches 2, 3, and 4 on **separate git worktrees / branches simultaneously**.

**Phase 1 — Safe parallel work (each branch):**
- CREATE new book pages (`wiki/books/`)
- CREATE new concept pages for concepts not yet in the wiki
- CREATE new people pages for authors not yet in the wiki
- CREATE new situation pages for situations not covered yet

**Phase 2 — Conflict-prone work (serialize after merge):**
- UPDATES to existing concept/people/situation pages that multiple batches may both touch  
  (e.g., `resilience.md`, `goal-setting.md`, `values-based-action.md`, `flow-states.md`)
- Each batch prompt asks the agent to tag updates-to-existing-pages in a staging note
  (`wiki/books/_batch-N-pending-updates.md`) so conflicts are explicit, not silent.

**Merge order:** Batch 2 → Batch 3 → Batch 4. Resolve conflicts using both batches' content — never discard; always merge additive content.

---

## Batch 2 Prompt

> Copy this entire block into the worktree agent.

```
You are the maintainer of a personal leadership wiki. Follow the schema and all 
instructions in #file:AGENTS.md exactly.

## Your Assignment — Batch 2: Leadership Operating System Classics

Process the following 8 books in order. For each book, follow the LLM Knowledge 
Protocol below before writing anything.

### Books to Process
1. What Got You Here Won't Get You There — Marshall Goldsmith (2007)
2. The Seven Habits of Highly Effective People — Stephen R. Covey (1989)
3. The One Minute Manager — Kenneth Blanchard & Spencer Johnson (1982)
4. One Minute Mentoring — Kenneth Blanchard & Claire Shankman (2017)
5. Peopleware: Productive Projects and Teams — Tom DeMarco & Timothy Lister (1987/1999)
6. The Goal: A Process of Ongoing Improvement — Eliyahu Goldratt (1984)
7. Humble Inquiry — Edgar H. Schein (2013)
8. Eat That Frog! — Brian Tracy (2001)

---

### LLM Knowledge Protocol (run for each book before writing)

State your confidence level explicitly:
- **HIGH**: You have detailed knowledge of this book's frameworks, key chapters, 
  specific examples, and notable quotes. Proceed: synthesize your knowledge into a 
  structured raw note, label it "Source: LLM knowledge", and ingest.
- **MEDIUM**: You know the core argument but are uncertain about specifics (chapter 
  order, exact quotes, secondary frameworks). Proceed with what you know, mark 
  uncertain sections with `[VERIFY]`, and note this in the log entry.
- **LOW**: You lack reliable detail. Stop: ask the user to drop raw notes into 
  `raw/books/<slug>/notes.md` before continuing.

---

### Wiki State — Read First

Before writing anything:
1. Read `wiki/index.md` to see every page that already exists.
2. Read `wiki/log.md` last 20 lines to understand recent work.
3. Do NOT recreate any page that already exists — update it instead.

### Existing concept pages you may need to extend (check index first):
`values-based-action.md`, `goal-setting.md`, `habit-loops.md`, `resilience.md`, 
`intrinsic-motivation.md`, `flow-states.md`, `radical-candor.md`, 
`psychological-flexibility.md`

---

### For Each Book — Full Ingest Sequence

Follow AGENTS.md §"Ingest a Book" exactly:

1. State your LLM confidence level for this book.
2. Create `wiki/books/<slug>.md` using the Book Page template in AGENTS.md.
3. Create NEW concept pages for any significant idea not yet in `wiki/index.md`.
4. EXTEND existing concept pages only if this book adds a meaningfully different 
   angle (new evidence, counter-argument, refinement). If updating an existing page, 
   also append the update to `wiki/books/_batch2-pending-updates.md` with format:
   `- [book-slug] → [concept-slug]: <one-line description of what was added>`
   This staging file is for merge conflict resolution only.
5. Create or update `wiki/people/<author-slug>.md`.
6. Create or update `wiki/situations/` pages where this book's advice directly 
   applies. Candidate situations to check or create:
   - Managing behavioral blind spots in leaders
   - Building effective habits and systems
   - Delegating and developing direct reports
   - Leading high-performing teams
   - Managing bottlenecks and constraints
   - Creating psychological safety through questions
   - Overcoming procrastination
7. After all 8 books: update `wiki/index.md` with every new/updated page.
8. Append a single consolidated log entry to `wiki/log.md`.

---

### Suggested Slugs

| Book | Slug |
|------|------|
| What Got You Here Won't Get You There | goldsmith-what-got-you-here |
| The Seven Habits | covey-seven-habits |
| The One Minute Manager | blanchard-one-minute-manager |
| One Minute Mentoring | blanchard-one-minute-mentoring |
| Peopleware | demarco-peopleware |
| The Goal | goldratt-the-goal |
| Humble Inquiry | schein-humble-inquiry |
| Eat That Frog | tracy-eat-that-frog |

---

### Key Concepts to Watch For (Batch 2 specific — create if missing)

- **20 Habits That Hold Leaders Back** (Goldsmith) — behavioral feedback loops
- **Maturity Continuum** (Covey) — dependence → independence → interdependence
- **Theory of Constraints** (Goldratt) — identify and exploit the system bottleneck
- **Flow efficiency vs. resource efficiency** (Goldratt/lean adjacent)
- **Asking vs. telling** (Schein) — humble inquiry as default stance
- **ABCDE procrastination framework** (Tracy) — priority ranking by consequence

---

### Cross-Linking Requirements

Every new page must link to at least 2 existing wiki pages. Prioritize links to:
- Existing situation pages in `wiki/situations/`
- `[[outward-mindset]]`, `[[radical-candor]]`, `[[rider-elephant-path]]`, 
  `[[values-based-action]]`, `[[flow-states]]`, `[[goal-setting]]`
```

---

## Batch 3 Prompt

> Copy this entire block into the worktree agent.

```
You are the maintainer of a personal leadership wiki. Follow the schema and all 
instructions in #file:AGENTS.md exactly.

## Your Assignment — Batch 3: Advanced Strategy, Judgment & Executive Thinking

Process the following 7 books in order. For each book, follow the LLM Knowledge 
Protocol below before writing anything.

### Books to Process
1. Making Numbers Count — Chip Heath & Karla Starr (2022)
2. Working Backwards: Insights, Stories, and Secrets from Inside Amazon — Colin Bryar & Bill Carr (2021)
3. Behave: The Biology of Humans at Our Best and Worst — Robert Sapolsky (2017)
4. Extreme Ownership: How U.S. Navy SEALs Lead and Win — Jocko Willink & Leif Babin (2015)
5. Deep Work: Rules for Focused Success in a Distracted World — Cal Newport (2016)
6. Antifragile: Things That Gain from Disorder — Nassim Nicholas Taleb (2012)
7. Principles: Life and Work — Ray Dalio (2017)

---

### LLM Knowledge Protocol (run for each book before writing)

State your confidence level explicitly:
- **HIGH**: Detailed working knowledge of frameworks, chapters, key examples. Proceed 
  with synthesis from LLM knowledge; label "Source: LLM knowledge" in log.
- **MEDIUM**: Core argument clear, specifics uncertain. Proceed; mark uncertain 
  sections `[VERIFY]`; note in log.
- **LOW**: Insufficient reliable detail. Stop; ask user for raw notes at 
  `raw/books/<slug>/notes.md`.

Note: Making Numbers Count is a 2022 book — flag if your training coverage is thin.

---

### Wiki State — Read First

1. Read `wiki/index.md` in full — know every existing page before writing.
2. Read `wiki/log.md` last 20 lines.
3. Do NOT recreate existing pages — extend them.

### Existing concept pages particularly relevant to Batch 3:
`flow-states.md`, `resilience.md`, `fear-management.md`, `goal-setting.md`,
`sticky-communication.md`, `values-based-action.md`, `ruthless-prioritization.md`,
`incremental-progression.md`, `premortem.md`

---

### For Each Book — Full Ingest Sequence

Follow AGENTS.md §"Ingest a Book" exactly:

1. State LLM confidence for this book.
2. Create `wiki/books/<slug>.md` using the Book Page template.
3. Create NEW concept pages for ideas not yet in `wiki/index.md`.
4. EXTEND existing concept pages only when this book adds a distinct angle. 
   Append each extension to `wiki/books/_batch3-pending-updates.md`:
   `- [book-slug] → [concept-slug]: <one-line description>`
5. Create or update `wiki/people/<author-slug>.md`.
6. Create or update `wiki/situations/` pages. Candidate situations:
   - Communicating data and numbers to non-technical audiences
   - Building a culture of ownership and accountability
   - Working deeply in a distracted environment
   - Designing antifragile systems and careers
   - Making decisions at scale using explicit principles
   - Understanding the biological roots of in-group/out-group conflict
   - Operating with extreme ownership in high-stakes situations
7. After all 7 books: update `wiki/index.md`.
8. Append a single consolidated log entry to `wiki/log.md`.

---

### Suggested Slugs

| Book | Slug |
|------|------|
| Making Numbers Count | heath-making-numbers-count |
| Working Backwards | bryar-working-backwards |
| Behave | sapolsky-behave |
| Extreme Ownership | willink-extreme-ownership |
| Deep Work | newport-deep-work |
| Antifragile | taleb-antifragile |
| Principles | dalio-principles |

---

### Key Concepts to Watch For (Batch 3 specific — create if missing)

- **Numeracy translation** (Heath/Starr) — making abstract data visceral and human-scale
- **Working Backwards / PR-FAQ method** (Amazon) — starting from the customer press release
- **Leadership Principles as operating system** (Amazon/Dalio) — explicit principles 
  over implicit culture
- **Decentralized command** (Willink) — authority pushed to lowest competent level
- **Extreme Ownership** — leader owns all outcomes, no excuses
- **Deep Work vs. Shallow Work** (Newport) — cognitively demanding vs. replicable tasks
- **Optionality and asymmetric bets** (Taleb) — positioning for upside from volatility
- **Antifragility** (Taleb) — systems that strengthen under stress, distinct from resilience
- **Radical transparency and algorithmic decision-making** (Dalio)
- **Limbic system override** (Sapolsky) — how stress, testosterone, and context hijack judgment

### Synthesis Opportunity (create if compelling)

If Extreme Ownership, Principles, and Working Backwards together suggest a coherent 
model of "explicit operating principles as leadership infrastructure," create:
`wiki/synthesis/explicit-principles-as-leadership-os.md`

---

### Cross-Linking Requirements

Every new page needs ≥2 outbound links. Prioritize:
- `[[flow-states]]`, `[[resilience]]`, `[[outward-mindset]]`, `[[values-based-action]]`,
  `[[rider-elephant-path]]`, `[[sticky-communication]]`, `[[premortem]]`
- Existing situation pages in `wiki/situations/`
```

---

## Batch 4 Prompt

> Copy this entire block into the worktree agent.

```
You are the maintainer of a personal leadership wiki. Follow the schema and all 
instructions in #file:AGENTS.md exactly.

## Your Assignment — Batch 4: Personal Philosophy & Long-Horizon Lens

Process the following 5 books in order. For each book, follow the LLM Knowledge 
Protocol below before writing anything.

### Books to Process
1. Man's Search for Meaning — Viktor E. Frankl (1946/1959)
2. Letters from a Stoic (Epistulae Morales) — Seneca (c. 65 AD)
3. Meditations — Marcus Aurelius (c. 161–180 AD)
4. Die With Zero: Getting All You Can from Your Money and Your Life — Bill Perkins (2020)
5. The Almanack of Naval Ravikant — Eric Jorgenson (2020)

---

### LLM Knowledge Protocol (run for each book before writing)

State your confidence level explicitly:
- **HIGH**: Detailed working knowledge. Proceed with LLM synthesis; label accordingly.
- **MEDIUM**: Core argument known, gaps exist. Proceed; mark `[VERIFY]`; note in log.
- **LOW**: Insufficient detail. Ask user for raw notes at `raw/books/<slug>/notes.md`.

Note: Meditations and Letters from a Stoic have existing wiki coverage via 
`wiki/books/stoic-leader.md` and `wiki/concepts/stoic-virtues.md` — extend those 
pages rather than duplicating. Die With Zero and Naval Almanack may have thinner 
training coverage — be explicit about confidence.

---

### Wiki State — Read First

1. Read `wiki/index.md` in full.
2. Read `wiki/books/stoic-leader.md` — this book already references Stoic philosophy;
   your Meditations and Letters pages must link to it and extend existing concepts.
3. Read `wiki/concepts/stoic-virtues.md` and `wiki/concepts/dichotomy-of-control.md`.
4. Read `wiki/concepts/values-based-action.md` and `wiki/concepts/resilience.md`.
5. Read `wiki/log.md` last 20 lines.

IMPORTANT: Do NOT recreate stoic-virtues.md or dichotomy-of-control.md. Extend them.

---

### For Each Book — Full Ingest Sequence

Follow AGENTS.md §"Ingest a Book" exactly:

1. State LLM confidence.
2. Create `wiki/books/<slug>.md`.
3. Create NEW concept pages for ideas not yet in `wiki/index.md`.
4. EXTEND existing concept pages (especially stoic ones) when this book adds depth.
   Append each extension to `wiki/books/_batch4-pending-updates.md`:
   `- [book-slug] → [concept-slug]: <one-line description>`
5. Create or update `wiki/people/<author-slug>.md`.
6. Create or update `wiki/situations/` pages. Candidate situations:
   - Finding meaning in suffering or adversity
   - Confronting mortality to clarify priorities
   - Structuring life around peak experiences, not deferred savings
   - Applying Stoic daily practice under pressure
   - Building wealth and leverage through specific knowledge and compounding
   - Resisting the pull of status games in favor of intrinsic values
7. After all 5 books: update `wiki/index.md`.
8. Append a single consolidated log entry to `wiki/log.md`.

---

### Suggested Slugs

| Book | Slug |
|------|------|
| Man's Search for Meaning | frankl-mans-search-for-meaning |
| Letters from a Stoic | seneca-letters-from-a-stoic |
| Meditations | aurelius-meditations |
| Die With Zero | perkins-die-with-zero |
| The Almanack of Naval Ravikant | jorgenson-naval-almanack |

---

### Key Concepts to Watch For (Batch 4 specific — create if missing)

- **Logotherapy / Will to Meaning** (Frankl) — meaning as primary human motivator,
  distinct from pleasure or power; suffering is bearable when it has purpose
- **Tragic optimism** (Frankl) — saying yes to life despite pain, guilt, and transience
- **Memento mori** (Seneca/Aurelius) — meditating on death as a prioritization tool
- **Negative visualization / Premeditatio malorum** (Stoics) — pre-experiencing loss 
  to reduce attachment and sharpen gratitude
- **Amor fati** (Stoic adjacent) — loving what is, including obstacles
- **Memory dividend** (Perkins) — experiences yield memories that compound across life
- **Time buckets** (Perkins) — allocating experiences to life stages before capability declines
- **Specific knowledge** (Naval) — knowledge you can't be trained for; found at 
  intersection of curiosity and skill
- **Leverage** (Naval) — code, capital, labor, media as force multipliers on effort
- **Happiness as a skill** (Naval) — trainable through internal practice, not external achievement

### Synthesis Opportunity (create if compelling)

Frankl, Seneca, Aurelius, and Naval Ravikant converge on the idea that meaning and 
values — not outcomes — are the proper locus of a life. If sufficiently rich, create:
`wiki/synthesis/meaning-values-and-the-good-life.md`

This should contrast with the Kotler/flow performance cluster, which is more 
outcome-oriented. Document the tension explicitly.

---

### Cross-Linking Requirements

Every new page needs ≥2 outbound links. Prioritize:
- `[[stoic-virtues]]`, `[[dichotomy-of-control]]`, `[[values-based-action]]`,
  `[[resilience]]`, `[[intrinsic-motivation]]`, `[[flow-states]]`,
  `[[stoic-leader]]` (book page, not concept)
- Existing situation pages in `wiki/situations/`
- `[[frankl-mans-search-for-meaning]]` ↔ `[[aurelius-meditations]]` ↔ 
  `[[seneca-letters-from-a-stoic]]` (these three should cross-link each other)
```

---

## Post-Merge Checklist

After all three branches are merged to main, run the following in a single agent pass:

```
You are the wiki maintainer. All three batch ingestion branches have been merged. 
Perform a post-merge reconciliation:

1. Read `wiki/books/_batch2-pending-updates.md`, `_batch3-pending-updates.md`, 
   and `_batch4-pending-updates.md`.
2. For each entry, open the target concept/people/situation page and apply the 
   described extension (adding the new book's perspective).
3. Resolve any duplicate additions that appear from multiple batches touching the 
   same concept.
4. Run a lint pass:
   - Find any new book pages with fewer than 2 outbound links.
   - Find any people pages missing for authors referenced in new book pages.
   - Check that `wiki/index.md` contains every page in all wiki subdirectories.
5. Update `wiki/index.md` for any missed pages.
6. Append a final log entry: `## [YYYY-MM-DD] update | Post-merge reconciliation — Batches 2–4`
7. Delete the three `_batch*-pending-updates.md` staging files.
```

---

## Quick Reference — Batch → Branch Name Suggestion

| Batch | Branch | Worktree Path |
|-------|--------|---------------|
| 2 | `feature/batch2-leadership-os` | `../llm-wiki-b2` |
| 3 | `feature/batch3-strategy-judgment` | `../llm-wiki-b3` |
| 4 | `feature/batch4-philosophy` | `../llm-wiki-b4` |
