---
name: Blog Site Release Rules
description: Conventions for blog layout/config/deployment-related changes.
applyTo: "config.yaml,layouts/**/*.html,themes/**/*.html,manifests/**/*.yaml,Dockerfile,Makefile,netlify.toml,kustomization.yaml"
---
# Blog site and release rules

- Prefer minimal, verifiable changes to build and deployment surfaces.
- Preserve existing infra and theme patterns unless the task requests migration.
- Run narrow validation first, then broaden only if needed.
- Summarize publish impact, operational risk, and rollback path for release-facing edits.
- Escalate business-prioritization decisions to parent AGENTS guidance.

## Validation Quick Checks

Run the smallest set that matches the change:

1. Run the standardized repo smoke check:
```bash
make smoke-check
```
2. Verify changed files are in release/build-related paths:
```bash
git diff --name-only -- config.yaml layouts/ themes/ manifests/ Dockerfile Makefile netlify.toml kustomization.yaml
```
3. Build container image when Docker and network are available:
```bash
make build
```
4. If cluster manifests changed, render/apply checks should be done before deployment.
