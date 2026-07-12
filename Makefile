HUGO_VERSION := 0.131.0

# Detect OS and Architecture
OS := $(shell uname -s | tr '[:upper:]' '[:lower:]')
ARCH := $(shell uname -m)

# Set Hugo package based on OS and ARCH
# Logic: if Darwin, use darwin-universal; if Linux + ARM, use linux-arm64; else linux-amd64
ifneq (,$(findstring darwin,$(OS)))
  HUGO_PKG := hugo_extended_$(HUGO_VERSION)_darwin-universal.tar.gz
else
  ifneq (,$(findstring aarch64,$(ARCH))$(findstring arm64,$(ARCH)))
    HUGO_PKG := hugo_extended_$(HUGO_VERSION)_linux-arm64.tar.gz
  else
    HUGO_PKG := hugo_extended_$(HUGO_VERSION)_linux-amd64.tar.gz
  endif
endif

help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.PHONY: run
run: .bin/hugo generate-commits  ## Run site locally with Hugo server
	@.bin/hugo server --buildFuture -D --cleanDestinationDir

.PHONY: build
build: .bin/hugo generate-commits  ## Build the site
	@.bin/hugo --minify

.PHONY: smoke-check
smoke-check: ## Run lightweight repository smoke checks
	@test -f AGENTS.md
	@test -f README.md
	@test -f config.yaml
	@test -d content
	@test -d themes/r15-papercss-hugo-theme
	@git status -s >/dev/null
	@echo "r15cookieblog smoke checks passed"

.PHONY: generate-commits
generate-commits:   ## Generate commits data for home page
	uv run scripts/generate-commits-data.py

.PHONY: update-theme
update-theme:   ## Update the Hugo theme from remote repo
	@./update-theme.sh feature/git-commits-support

.PHONY: clean
clean:           ## Clean build artifacts
	@rm -rf public/
	@rm -rf .bin/
	@echo "Cleaned."

.PHONY: newcontent
# TODO: implement based on parameter
# hugo new content post/my-new-post.md
# and can auto-open in codespaces with
# `code <filename>`

.bin/hugo:
	@mkdir -p .bin
	@echo "Platform detected: $(OS)/$(ARCH)"
	@echo "Downloading: $(HUGO_PKG)"
	@curl -fL -o .bin/hugo.tar.gz "https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/$(HUGO_PKG)"
	@tar -xzf .bin/hugo.tar.gz -C .bin
	@rm -f .bin/hugo.tar.gz
	@# Rename extracted binary to hugo
	@if [ -f .bin/hugo ]; then :; else mv .bin/hugo .bin/hugo; fi
	@chmod +x .bin/hugo
	@echo "Hugo ready: $$(.bin/hugo version)"

# Help Source: https://gist.github.com/prwhite/8168133
