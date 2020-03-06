MAKEFLAGS += --no-builtin-rules

all: version build

build:
	@emacs --batch -l publish.el -f toggle-debug-on-error -f publish-website
	@cp -r css .public/

version:
	@emacs --version
	@emacs --batch -l publish.el -f org-version

clean:
	@rm -rf ./.public

.PHONY: all build version
