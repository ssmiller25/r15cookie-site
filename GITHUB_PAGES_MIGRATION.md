# GitHub Pages Migration Runbook (Apex Canonical)

This runbook migrates deployment from Netlify to GitHub Pages for this repository, with `r15cookie.com` as the canonical domain.

## What was changed in this repo

- Canonical site URL updated in Hugo config:
  - `baseURL` in `config.yaml` now points to `https://r15cookie.com`
- Added `static/CNAME` containing `r15cookie.com`
  - Hugo copies this into `public/CNAME` during build, which tells GitHub Pages to use the custom domain.

## 1) GitHub repository prerequisites

1. Ensure this repository is hosted in GitHub under your account/org.
2. In repo settings, do not set Pages source to a branch; use **GitHub Actions** (set in step 3).

## 2) Add GitHub Actions workflow (pipeline sketch)

Create `.github/workflows/deploy-hugo-pages.yml`:

```yaml
name: Deploy Hugo site to GitHub Pages

on:
  push:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: pages
  cancel-in-progress: true

jobs:
  build:
    runs-on: ubuntu-latest
    env:
      HUGO_VERSION: 0.125.7
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: recursive
          fetch-depth: 0

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v3
        with:
          hugo-version: ${{ env.HUGO_VERSION }}
          extended: true

      - name: Build site
        run: hugo --minify

      - name: Configure Pages
        uses: actions/configure-pages@v5

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./public

  deploy:
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

Notes:
- `submodules: recursive` is required because the theme is a Git submodule.
- Since `static/CNAME` is committed, no extra workflow step is needed to write `public/CNAME`.

## 3) Configure Pages in GitHub

1. Go to **Settings -> Pages**.
2. Set **Source** to **GitHub Actions**.
3. Trigger workflow by pushing to `main`.
4. After first successful deploy, verify the GitHub Pages URL loads successfully.

## 4) Pre-cutover validation (before DNS changes)

1. Confirm latest workflow run succeeded on `main`.
2. Confirm generated site content looks correct at the GitHub Pages URL.
3. In **Settings -> Pages**, set custom domain to `r15cookie.com` and save.
4. Confirm `static/CNAME` exists in repo so build artifacts include `public/CNAME`.

## 5) DNS setup for apex canonical (cutover step)

At your DNS provider for `r15cookie.com`:

1. Create apex `A` records:
  - `185.199.108.153`
  - `185.199.109.153`
  - `185.199.110.153`
  - `185.199.111.153`
2. (Recommended) Add apex `AAAA` records:
  - `2606:50c0:8000::153`
  - `2606:50c0:8001::153`
  - `2606:50c0:8002::153`
  - `2606:50c0:8003::153`
3. Configure `www` host to redirect to apex canonical:
  - Preferred: HTTP 301 redirect `www.r15cookie.com` -> `https://r15cookie.com`
  - If your DNS host cannot redirect at DNS level, use a forwarding/URL redirect feature.

## 6) Migration cutover checklist

1. Merge workflow to `main`.
2. Wait for successful Pages deployment.
3. Apply DNS changes from step 5.
4. Confirm DNS records are live (`dig r15cookie.com +short`).
5. Verify content and links on:
   - `https://r15cookie.com`
   - `https://www.r15cookie.com` (should redirect to apex)
6. In **Settings -> Pages**, confirm custom domain remains `r15cookie.com` and enable **Enforce HTTPS** when available.
7. Disable Netlify auto-deploy and remove stale Netlify DNS/redirect rules to avoid split traffic.

## 7) Validation and troubleshooting

1. If theme/layout is missing in build output:
   - Check workflow uses submodules recursively.
2. If domain is not attached:
   - Confirm `public/CNAME` exists in build artifact (from `static/CNAME`).
3. If TLS is pending:
   - Wait for DNS propagation and re-check Pages custom domain status.
4. If canonical URL is wrong in generated metadata:
   - Confirm `baseURL` in `config.yaml` is `https://r15cookie.com`.

## 8) Optional cleanup

1. Remove Netlify badge/config references from `README.md`.
2. Remove `netlify.toml` once migration is fully complete.
