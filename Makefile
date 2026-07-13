HUGO_VERSION := 0.131.0
NOTES_REF := refs/notes/site-display

# Detect OS and Architecture
OS := $(shell uname -s | tr '[:upper:]' '[:lower:]')
ARCH := $(shell uname -m)

# Set Hugo package based on OS and ARCH
ifeq ($(OS),darwin)
  HUGO_PKG := hugo_extended_$(HUGO_VERSION)_darwin-universal.tar.gz
else ifneq (,$(findstring mingw,$(OS))$(findstring msys,$(OS))$(findstring cygwin,$(OS)))
  # Native Windows (Git Bash/MSYS/Cygwin) isn't supported: uname reports a Windows
  # kernel name here, but the linux-* Hugo tarballs below won't execute on Windows.
  HUGO_PKG := UNSUPPORTED
else ifeq ($(ARCH),aarch64)
  HUGO_PKG := hugo_extended_$(HUGO_VERSION)_linux-arm64.tar.gz
else ifeq ($(ARCH),arm64)
  HUGO_PKG := hugo_extended_$(HUGO_VERSION)_linux-arm64.tar.gz
else
  HUGO_PKG := hugo_extended_$(HUGO_VERSION)_linux-amd64.tar.gz
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

.PHONY: note
note:   ## Add/edit a display-override note for a commit: make note HASH=<commit-hash>
	@test -n "$(HASH)" || (echo "Usage: make note HASH=<commit-hash>"; exit 1)
	@git notes --ref=$(NOTES_REF) edit $(HASH)
	@echo "Note saved locally. Run 'make notes-push' to publish it."

.PHONY: notes-push
notes-push:   ## Publish local display-override notes to origin
	@git push origin $(NOTES_REF)

.PHONY: notes-sync
notes-sync:   ## Fetch display-override notes from origin
	@git fetch origin $(NOTES_REF):$(NOTES_REF)

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
	@if [ "$(HUGO_PKG)" = "UNSUPPORTED" ]; then \
		echo "ERROR: Native Windows (Git Bash/MSYS/Cygwin) is not supported by this Makefile."; \
		echo "The Linux Hugo binary this Makefile downloads will not run on Windows."; \
		echo "Use the DevContainer (.devcontainer/) or WSL instead."; \
		exit 1; \
	fi
	@echo "Platform detected: $(OS)/$(ARCH)"
	@echo "Downloading: $(HUGO_PKG)"
	@curl -fL -o ".bin/$(HUGO_PKG)" "https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/$(HUGO_PKG)"
	@curl -fL -o .bin/hugo_checksums.txt "https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_checksums.txt"
	@grep -F "  $(HUGO_PKG)" .bin/hugo_checksums.txt > .bin/hugo.sha256
	@if [ ! -s .bin/hugo.sha256 ]; then echo "ERROR: no checksum entry found for $(HUGO_PKG)"; exit 1; fi
	@(cd .bin && sha256sum -c hugo.sha256)
	@tar -xzf ".bin/$(HUGO_PKG)" -C .bin
	@rm -f ".bin/$(HUGO_PKG)" .bin/hugo_checksums.txt .bin/hugo.sha256
	@# Binary is extracted as 'hugo' in .bin/ directory
	@if [ ! -f .bin/hugo ]; then echo "ERROR: Hugo binary not found after extraction"; exit 1; fi
	@chmod +x .bin/hugo
	@echo "Hugo ready: $$(.bin/hugo version)"

# Help Source: https://gist.github.com/prwhite/8168133
