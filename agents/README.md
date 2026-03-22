# r15cookieblog Agent Drafts

Confined draft persona set for `r15cookieblog/`.

## Usage

1. Choose one lead persona.
2. Add up to one supporting persona when needed.
3. Resolve cross-domain conflicts using `../../AGENTS.md`.

## Personas

- `personas/editorial.md` - writing quality and narrative clarity
- `personas/distribution.md` - metadata, structure, and discoverability
- `personas/release.md` - build, container, and deployment safety checks
- `personas/curation.md` - legacy content review using MUSTIE keep/refine/eliminate criteria

## Persona Invocation Examples

Example 1: editorial improvement
```markdown
Lead Persona: editorial.md
Supporting Personas: none
Task: Tighten narrative flow and readability for a draft post.
Output Shape:
1. Edits made
2. Voice/clarity notes
3. Remaining decisions
4. Publish readiness
```

Example 2: distribution plus release confidence
```markdown
Lead Persona: distribution.md
Supporting Personas: release.md
Task: Improve metadata and verify deployment safety for a scheduled post.
Output Shape:
1. Metadata updates
2. Build/deploy checks
3. Risks
4. Rollback notes
```

Example 3: curation task
```markdown
Lead Persona: curation.md
Supporting Personas: editorial.md
Task: Evaluate older posts for keep/refine/archive/remove.
Output Shape (MUSTIE):
1. Item
2. MUSTIE flag(s)
3. Recommendation
4. Rationale
5. Redirect/update
```
