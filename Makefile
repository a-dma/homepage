MAKEFLAGS += --no-builtin-rules

all: build

build:
	@emacs --batch -q --load publish.el -f toggle-debug-on-error -f publish-website
	@cp -r css .public/

clean:
	@rm -rf ./.public

.PHONY: all build
