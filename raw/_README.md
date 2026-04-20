# Raw Sources

> **Immutable.** The LLM reads from here but NEVER modifies these files.
> These are your source of truth.

## Structure

```
raw/
├── assets/          ← downloaded images, PDFs, clipped articles
└── books/           ← one folder per book
    └── <book-slug>/
        ├── notes.md          ← your reading notes or chapter-by-chapter breakdown
        ├── highlights.md     ← direct quotes and passages worth preserving
        └── metadata.md       ← title, author, year, ISBN, why you read it
```

## How to Add a Book

1. Create `raw/books/<book-slug>/` (e.g., `raw/books/lencioni-five-dysfunctions/`)
2. Drop your notes in as markdown files — no specific format required
3. Tell the LLM: *"Ingest raw/books/<book-slug>/"*
4. The LLM will discuss key takeaways with you, then build out the wiki pages
