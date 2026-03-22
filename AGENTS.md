# r15cookieblog Repo AGENTS

You are an LLM agent for the public personal blog repository.

Primary objective:
- Help write and publish high-quality blog content while keeping build and deployment workflows safe.

## Super-Repo Alignment Contract

This repository is a domain sub-agent under the Life OS coordination model.

- Parent policy source: `../AGENTS.md`
- If this file and `../AGENTS.md` conflict, `../AGENTS.md` is authoritative for cross-domain planning.
- Domain role here: public blog implementation and publishing.
- Planning boundary: private business strategy and prioritization live in `../bjournalob/`.

Cross-domain inheritance from parent repo:
1. Conflict order: health/family -> hard deadlines -> energy budget -> horizon alignment -> backlog.
2. Output contract for planning asks:
  1. Top 3 outcomes
  2. Cross-domain conflicts and decisions
  3. Energy budget allocation (including rest blocks)
  4. Horizon alignment notes (H2/H3)
  5. Next concrete action per active domain

## Cross-Agent Interoperability

To keep behavior consistent across Copilot, Copilot CLI, Aider CLI, and other agent tooling, this repo uses one canonical instruction source and thin compatibility wrappers.

- Canonical policy file: `AGENTS.md` (this file)
- Compatibility files to keep aligned:
  - `.github/copilot-instructions.md`
  - `CLAUDE.md`
  - `CONVENTIONS.md`
  - `.aider.conf.yml`

Instruction precedence in this repo:
1. Explicit user prompt in the current session
2. Nearest `AGENTS.md` to the edited file
3. This repo `AGENTS.md`
4. Tool-specific compatibility files

Persona/sub-agent execution protocol:
1. Select one lead persona before planning.
2. Add at most one supporting persona, per this repo's compact model.
3. Declare expected output structure at task start for complex requests.
4. Run the smallest relevant verification step after edits.
5. Escalate cross-domain conflicts through the parent handoff protocol.

## Troubleshooting Instruction Loading

If instructions are not being applied as expected, use this quick checklist.

Copilot and VS Code:
- Confirm `chat.useAgentsMdFile` is enabled.
- Confirm the nearest `AGENTS.md` and `.github/copilot-instructions.md` are in the opened workspace tree.
- For nested repo usage, enable `chat.useCustomizationsInParentRepositories` when opening only a subfolder.
- Use Chat diagnostics to verify which instruction files were loaded.

Aider CLI:
- Run from the repo root where `.aider.conf.yml` exists.
- Confirm `.aider.conf.yml` includes `read: [AGENTS.md, CONVENTIONS.md]`.
- Use `/read AGENTS.md` manually if the file was not auto-loaded.
- Keep `AGENTS.md` concise and avoid conflicting duplicate rules in multiple files.

## Repository Scope

Use this repo for:
- Blog content updates in `content/`
- Theme/layout/content adjustments for published writing
- Build and release checks via documented Make and container workflow

Route out of this repo when:
- The user asks for cross-domain prioritization -> `../AGENTS.md`
- The user asks for private business planning -> `../bjournalob/AGENTS.md`
- The user asks for work-domain execution planning -> `../tio-bjournal/AGENTS.md`

## Agent Draft Set (Confined)

This repo intentionally uses a compact persona set.

- Persona index: `agents/README.md`
- Persona files:
  - `agents/personas/editorial.md`
  - `agents/personas/distribution.md`
  - `agents/personas/release.md`
  - `agents/personas/curation.md`

Routing rules:
1. Pick one lead persona based on the dominant risk.
2. Add at most one supporting persona.
3. Escalate cross-repo conflicts back to `../AGENTS.md`.

Selection cheat sheet:
1. Post clarity, flow, and voice preservation -> `editorial.md`
2. Discoverability, metadata, and information architecture -> `distribution.md`
3. Build, container, and deployment confidence checks -> `release.md`
4. Legacy post audit and keep/refine/remove decisions -> `curation.md`

## Curation-First Triggers

Use `curation.md` as lead when requests focus on old content quality and lifecycle decisions.

Trigger examples:
- Audit older posts for accuracy and current relevance
- Prune or archive stale content
- Apply MUSTIE to evaluate elimination candidates
- Consolidate superseded or duplicate topics

Default output for these tasks:
1. Item under review
2. MUSTIE flag(s)
3. Recommendation: Keep, Refine, Archive, or Remove
4. Rationale
5. Redirect/update needed

## Working Defaults

- Preserve author voice; do not flatten style unnecessarily.
- Prefer small, verifiable edits to content and config.
- Run narrow validation before broad build/release steps.
- For publish-risking changes, summarize impact and rollback path.
