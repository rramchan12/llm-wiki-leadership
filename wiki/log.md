# Wiki Log

> Append-only. Each entry starts with `## [YYYY-MM-DD] <operation> | <title>` for grep-parsability.
> Operations: `ingest`, `query`, `lint`, `update`

---

## [2026-04-20] init | Wiki created

- Initialized AGENTS.md schema
- Created wiki structure: books/, concepts/, people/, situations/, synthesis/
- Pages touched: 0
- Status: ready for first book ingest

## [2026-04-20] ingest | Feeling Good — David D. Burns
- Created: wiki/books/burns-feeling-good.md
- Created: wiki/concepts/cognitive-distortions.md
- Created: wiki/people/david-burns.md
- Source: model knowledge (no raw notes provided)
- Pages touched: 3

## [2026-04-20] ingest | The Happiness Trap — Russ Harris
- Created: wiki/books/harris-happiness-trap.md
- Created: wiki/concepts/psychological-flexibility.md
- Created: wiki/concepts/cognitive-defusion.md
- Created: wiki/concepts/values-based-action.md
- Created: wiki/people/russ-harris.md
- Source: model knowledge (no raw notes provided)
- Pages touched: 5

## [2026-04-20] ingest | Unwinding Anxiety — Judson Brewer
- Created: wiki/books/brewer-unwinding-anxiety.md
- Created: wiki/concepts/habit-loops.md
- Created: wiki/people/judson-brewer.md
- Source: model knowledge (no raw notes provided)
- Pages touched: 3

## [2026-04-20] ingest | Leadership and Self-Deception — The Arbinger Institute
- Created: wiki/books/arbinger-self-deception.md
- Created: wiki/concepts/self-deception.md
- Created: wiki/concepts/outward-mindset.md
- Created: wiki/people/arbinger-institute.md
- Source: model knowledge (no raw notes provided)
- Pages touched: 4

## [2026-04-20] ingest | The Anatomy of Peace — The Arbinger Institute
- Created: wiki/books/arbinger-anatomy-of-peace.md
- Updated: wiki/concepts/self-deception.md, wiki/concepts/outward-mindset.md, wiki/people/arbinger-institute.md
- Source: model knowledge (no raw notes provided)
- Pages touched: 4

## [2026-04-20] ingest | The First 90 Days — Michael D. Watkins
- Created: wiki/books/watkins-first-90-days.md
- Created: wiki/concepts/transition-acceleration.md
- Created: wiki/concepts/early-wins.md
- Created: wiki/people/michael-watkins.md
- Source: model knowledge (no raw notes provided)
- Pages touched: 4

## [2026-04-20] ingest | The Art of Impossible — Steven Kotler
- Created: wiki/books/kotler-art-of-impossible.md
- Created: wiki/concepts/intrinsic-motivation.md
- Updated: wiki/concepts/flow-states.md, wiki/concepts/goal-setting.md, wiki/concepts/community-and-group-flow.md
- Updated: wiki/people/steven-kotler.md
- Source: model knowledge (no raw notes provided)
- Pages touched: 6

## [2026-04-20] update | Cross-book concept updates
- Updated: wiki/concepts/four-villains-of-decision-making.md (added cross-refs to Burns, Arbinger, Brewer)
- Created: wiki/situations/managing-negative-thought-patterns.md (Burns + Harris + Brewer)
- Created: wiki/situations/breaking-anxiety-cycles.md (Brewer + Harris + Burns)
- Created: wiki/situations/navigating-interpersonal-conflict.md (Arbinger + Harris + Heath)
- Created: wiki/situations/starting-a-new-leadership-role.md (Watkins + Heath + Arbinger)
- Created: wiki/situations/pursuing-impossible-goals.md (Kotler + Harris + Heath)
- Updated: wiki/index.md — all 46 pages cataloged
- Pages touched: 8

---

## [2026-04-20] ingest | Decisive — Chip Heath & Dan Heath (2013)

- Source: `raw/books/heath-decisive/notes.md` (synthesized from known book content)
- Pages created:
  - `wiki/books/heath-decisive.md` — full book summary with WRAP playbook up front
  - `wiki/concepts/wrap-framework.md` — four-step WRAP decision framework
  - `wiki/concepts/four-villains-of-decision-making.md` — narrow framing, confirmation bias, short-term emotion, overconfidence
  - `wiki/concepts/premortem.md` — assume-failure mental simulation technique

---

## [2026-04-22] lint | Full wiki health-check

### Findings

#### 1. Contradictions

**1.1 Arbinger "No Techniques" vs. Listed Steps**
- Files: `wiki/books/arbinger-anatomy-of-peace.md` vs. `wiki/books/arbinger-self-deception.md`
- `arbinger-anatomy-of-peace.md` quotes: "There are no techniques for getting out of the box." Yet `arbinger-self-deception.md` provides four numbered steps for getting out of the box. `wiki/concepts/self-deception.md` also presents a numbered six-step sequence. The pages do not reconcile this tension.
- Recommendation: Add a clarifying note in `arbinger-self-deception.md` that these steps are orientations reflecting a shift of heart, not a checklist.

**1.2 Burns vs. Harris: Philosophical Root of Suffering**
- Files: `wiki/books/burns-feeling-good.md` vs. `wiki/books/harris-happiness-trap.md`
- Burns: "Depression is not an emotional problem at all. It's a thinking problem." Harris: struggling against negative emotions is itself the problem. ACT explicitly challenges the CBT assumption that fixing thinking fixes feelings. The wiki notes they are complementary but leaves the philosophical tension unresolved.
- Recommendation: Create a synthesis page "CBT vs. ACT: How to Choose" or add a reconciliation note to `wiki/concepts/cognitive-distortions.md`.

---

#### 2. Stale / Superseded Claims

**2.1 Feeling Good — 1980 Edition Only**
- File: `wiki/books/burns-feeling-good.md`
- The 1999 revised edition is what clinicians and researchers cite today. The page makes no mention of the 1999 revision; readers obtaining the 1980 original may find chapter structure mismatches.
- Recommendation: Update title line to note both editions (1980; revised 1999).

**2.2 Unsourced 7-Year Lifespan Claim**
- File: `wiki/concepts/peak-performance-aging.md`
- States "A shift in mindset toward aging can add ~7 years to lifespan" without attribution. This is from Becca Levy's 2002 research (not ingested).
- Recommendation: Attribute claim to Becca Levy or flag as unverified.

**2.3 Index Footer Count Discrepancy**
- Files: `wiki/log.md`, `wiki/index.md`
- Log records 46 pages cataloged + 1 added = 47. Manual count of index tables yields 45 (9 books + 21 concepts + 8 people + 7 situations). Footer is off by 2.
- Recommendation: Correct index footer to "Total pages: 45."

---

#### 3. Orphan Pages

**3.1 `wiki/situations/feeling-like-an-underachiever.md` — Near-Orphan**
- This situation page links outward to `[[managing-negative-thought-patterns]]`, `[[breaking-anxiety-cycles]]`, and `[[pursuing-impossible-goals]]` but NONE of those pages link back to it.
- `managing-negative-thought-patterns.md` Related situations: `[[breaking-anxiety-cycles]], [[facing-a-major-decision]]` — no link to feeling-like-an-underachiever
- `breaking-anxiety-cycles.md` Related situations: `[[managing-negative-thought-patterns]]` only
- `pursuing-impossible-goals.md` Related situations: `[[facing-a-major-decision]], [[breaking-anxiety-cycles]]` — no link to feeling-like-an-underachiever
- Additionally, concept pages that should list it in "Applied in" but don't: `cognitive-distortions`, `cognitive-defusion`, `habit-loops`, `self-deception`, `intrinsic-motivation`, `psychological-flexibility`, `values-based-action`.
- Recommendation: Add `[[feeling-like-an-underachiever]]` to "Related situations" in the three situation pages above, and to "Applied in" in the eight concept pages above.

---

#### 4. Missing Concept Pages

The following concepts are referenced via `[[wikilink]]` in multiple pages but have no concept page:

| Missing Concept | Referenced In | Inbound Link Count |
|---|---|---|
| `[[fear-management]]` | `flow-states.md`, `community-and-group-flow.md`, `kotler-gnar-country.md`, `gnar-country-mindset.md`, `incremental-progression.md`, `goal-setting.md` | 6 |
| `[[resilience]]` | `kotler-gnar-country.md`, `community-and-group-flow.md`, `stacked-practices.md`, `gnar-country-mindset.md`, `peak-performance-aging.md` | 5 |
| `[[ruthless-prioritization]]` | `kotler-gnar-country.md`, `goal-setting.md`, `values-based-action.md`, `stacked-practices.md`, `gnar-country-mindset.md` | 5 |
| `[[developmental-gateways]]` | `kotler-gnar-country.md`, `peak-performance-aging.md`, `gnar-country-mindset.md` | 3 |
| `[[fast-geometry]]` | `kotler-gnar-country.md`, `flow-states.md` | 2 |
| `[[RAIN]]` | `brewer-unwinding-anxiety.md` (key framework, no concept page created) | 1 |

Additional concepts mentioned in prose but never formally paged:
- Growth mindset (Dweck) — cited in `kotler-art-of-impossible.md` as prerequisite for peak performance
- Massively Transformative Purpose (MTP) — heavily used in `kotler-art-of-impossible.md` and `intrinsic-motivation.md`
- Ooching — described in `wrap-framework.md` and `heath-decisive.md` as a distinct technique

High-priority (5+ broken links): `fear-management`, `resilience`, `ruthless-prioritization`.

---

#### 5. Missing Cross-References

**5.1 `wiki/situations/facing-a-major-decision.md` — No Connections Section**
- Every other situation page has a "Connections" block. This page ends with "Sources & Related Pages" only — no links to related situations.
- Missing: `[[starting-a-new-leadership-role]]`, `[[pursuing-impossible-goals]]`, `[[navigating-interpersonal-conflict]]`.

**5.2 `wiki/books/kotler-gnar-country.md` — Sparse Connections Section**
- Connections section only has: "Supports: [[peak-performance-aging]], [[flow-states]], [[resilience]], [[goal-setting]] — See also: [[steven-kotler]]"
- Missing: `[[community-and-group-flow]]`, `[[incremental-progression]]`, `[[stacked-practices]]`, `[[gnar-country-mindset]]`, `[[intrinsic-motivation]]`, `[[pursuing-impossible-goals]]`.

**5.3 `wiki/concepts/self-deception.md` — Narrow "Applied in"**
- "Applied in: `[[navigating-interpersonal-conflict]]`" only.
- Missing: `[[starting-a-new-leadership-role]]`, `[[feeling-like-an-underachiever]]`.

**5.4 `wiki/concepts/values-based-action.md` — Missing Situation Links**
- "Applied in: `[[managing-negative-thought-patterns]], [[pursuing-impossible-goals]]`"
- Missing: `[[breaking-anxiety-cycles]]` (Step 4), `[[feeling-like-an-underachiever]]` (Step 5).

**5.5 `wiki/concepts/intrinsic-motivation.md` — Missing Inbound Situation Link**
- "Applied in: `[[pursuing-impossible-goals]]`" only.
- Missing: `[[feeling-like-an-underachiever]]`.

---

#### 6. Frontmatter Issues

| File | Issue |
|---|---|
| `concepts/psychological-flexibility.md` | `sources` field missing `arbinger-self-deception` and `burns-feeling-good` — both discussed substantively in body |
| `concepts/values-based-action.md` | `sources` field missing `heath-decisive` and `arbinger-anatomy-of-peace` — both in "How Books Treat This" table |
| `concepts/intrinsic-motivation.md` | `sources` field missing `brewer-unwinding-anxiety` — appears in "How Books Treat This" table |
| `situations/pursuing-impossible-goals.md` | `sources` field missing `brewer-unwinding-anxiety` — used in Backing Evidence table |
| `situations/navigating-interpersonal-conflict.md` | `sources` field missing `burns-feeling-good` — used in Backing Evidence table |
| `wiki/index.md` | Footer "Total pages: 47" does not match manual count of 45 cataloged entries (9+21+8+7). Off by 2. |

All other pages pass frontmatter validation (title, category, tags, sources, created, updated present and non-empty).

---

#### 7. Index Gaps

No pages are missing from the index — all 45 audited files correspond to index entries. The sole issue is the footer count discrepancy (47 stated vs. 45 actual).

---

#### 8. Gaps / Suggested Reading

| Gap | Why It Matters | Suggested Source |
|---|---|---|
| Change management | `dan-heath.md` and `chip-heath.md` reference *Switch* (Rider/Elephant/Path) as directly relevant; no book or concept page | *Switch* — Chip & Dan Heath |
| Deliberate practice | Referenced in Kotler pages (Ericsson) as learning mechanism; no concept page | *Peak* — Anders Ericsson |
| Growth mindset | Cited in `kotler-art-of-impossible.md` as prerequisite; no page | *Mindset* — Carol Dweck |
| Psychological safety | Directly relevant to `community-and-group-flow.md` and `outward-mindset.md`; not represented | *The Fearless Organization* — Amy Edmondson |
| Systems thinking / upstream | Dan Heath's *Upstream* mentioned in `dan-heath.md` but no book page | *Upstream* — Dan Heath |
| Feedback and coaching | Watkins addresses team assessment; no concept page on giving/receiving feedback | *Thanks for the Feedback* — Stone & Heen |
| Organizational culture | Watkins repeatedly cites culture as constraint; no concept or book page | *Organizational Culture and Leadership* — Schein |
| Emotional intelligence | Runs through Arbinger and Watkins themes but not represented | *Emotional Intelligence* — Goleman |
| Stoicism | Values-based action, acceptance of discomfort connect directly to Harris and Kotler | *Meditations* — Marcus Aurelius |

---

#### Priority Summary

| Priority | Finding |
|---|---|
| 🔴 High | 6 missing concept pages with 2–6 broken inbound links each (`fear-management`, `resilience`, `ruthless-prioritization`, `developmental-gateways`, `fast-geometry`, `RAIN`) |
| 🔴 High | `feeling-like-an-underachiever.md` orphan — no inbound links from 3 related situation pages or 8 concept pages |
| 🟡 Medium | 5 files with incomplete frontmatter `sources` fields |
| 🟡 Medium | `facing-a-major-decision.md` missing Connections section |
| 🟡 Medium | `kotler-gnar-country.md` sparse Connections section |
| 🟢 Low | Index footer count wrong (47 vs. 45 actual) |
| 🟢 Low | `burns-feeling-good.md` does not note 1999 revised edition |
| 🟢 Low | Unsourced 7-year lifespan claim in `peak-performance-aging.md` |
| 🟢 Low | Arbinger "no techniques" vs. listed steps unreconciled across two book pages |

- Pages audited: 45
- Pages with issues: 20+
- Broken wikilinks (missing target pages): ~22 total across 6 missing concept pages
  - `wiki/concepts/tripwires.md` — pre-set decision review triggers
  - `wiki/people/chip-heath.md` — author profile
  - `wiki/people/dan-heath.md` — author profile
  - `wiki/situations/facing-a-major-decision.md` — full WRAP playbook for high-stakes decisions
- Pages updated:
  - `wiki/index.md` — added all new pages; also back-filled Gnar Country book and concept entries
- Cross-references added to: [[goal-setting]] (Gnar Country ↔ Decisive connection noted)
- Pages touched: 9 new + 1 updated = 10
- Status: complete

## [2026-04-20] query | Feeling depressed about being an underachiever
- Created: wiki/situations/feeling-like-an-underachiever.md
- Sources consulted: burns-feeling-good, harris-happiness-trap, brewer-unwinding-anxiety, arbinger-anatomy-of-peace, kotler-art-of-impossible
- Concepts referenced: cognitive-distortions, cognitive-defusion, self-deception, habit-loops, values-based-action, intrinsic-motivation, psychological-flexibility
- Updated: wiki/index.md
- Pages touched: 2 (1 new + 1 updated)

---

## [2026-04-22] update | Lint fixes applied

- Created 6 missing concept pages: `fear-management`, `resilience`, `ruthless-prioritization`, `developmental-gateways`, `fast-geometry`, `RAIN`
- Fixed orphan `feeling-like-an-underachiever.md`: added inbound links from 3 situation pages and 7 concept pages
- Fixed frontmatter `sources` fields in 5 files: `psychological-flexibility.md`, `values-based-action.md`, `intrinsic-motivation.md`, `pursuing-impossible-goals.md`, `navigating-interpersonal-conflict.md`
- Added Connections section to `facing-a-major-decision.md`
- Expanded Connections section in `kotler-gnar-country.md`
- Corrected index footer: Total pages: 51
- Updated `burns-feeling-good.md` to note 1999 revised edition
- Attributed 7-year lifespan claim in `peak-performance-aging.md` to Becca Levy (2002)
- Added clarifying note to `arbinger-self-deception.md` reconciling "no techniques" vs. listed steps
- Added CBT vs. ACT reconciliation note to `cognitive-distortions.md`
- Updated `wiki/index.md` with 6 new concept pages
