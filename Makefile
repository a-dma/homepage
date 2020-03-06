MAKEFLAGS += --no-builtin-rules

all: build

build:
	@emacs --batch -q --load publish.el -f toggle-debug-on-error -f publish-website
	@cp -r css .public/

version:
	@emacs --version
	@emacs --batch -q -f org-version

clean:
	@rm -rf ./.public

.PHONY: all build
