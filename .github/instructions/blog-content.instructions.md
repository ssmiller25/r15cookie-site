---
name: Blog Content Rules
description: Conventions for blog content markdown files.
applyTo: "content/**/*.md,archetypes/**/*.md"
---
# Blog content rules

- Preserve author voice; improve clarity without flattening style.
- Keep metadata complete and aligned with current publishing structure.
- Make edits in small, reviewable slices with clear intent.
- For curation requests, use MUSTIE output shape and include redirect/update notes.
- If unsure about editorial meaning, keep original phrasing and ask before major rewrites.

## Validation Quick Checks

Run the smallest set that matches the change:

1. Run the standardized repo smoke check:
```bash
make smoke-check
```
2. Verify modified files are content-scoped:
```bash
git diff --name-only -- content/ archetypes/
```
3. Spot-check key frontmatter fields in changed content:
```bash
rg -n "^---$|^title:|^date:|^draft:" content archetypes -g "*.md"
```
4. If post metadata or routing changed, run a build check:
```bash
make build
```
