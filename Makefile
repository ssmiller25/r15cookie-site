HUGO_VERSION := 0.131.0

help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.PHONY: run
run: .bin/hugo   ## Run site locally with Hugo server
	@.bin/hugo server --buildFuture -D --cleanDestinationDir

.PHONY: build
build: .bin/hugo   ## Build the site
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
	@mkdir -p .bin || true
	@curl -Lo .bin/hugo.tar.gz "https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_linux-amd64.tar.gz"
	@tar -xzf .bin/hugo.tar.gz -C .bin
	@rm .bin/hugo.tar.gz
	@chmod +x .bin/hugo

# Help Source: https://gist.github.com/prwhite/8168133
