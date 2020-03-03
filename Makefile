MAKEFLAGS += --no-builtin-rules

all: build

build:
	@emacs --batch -q --load publish.el -f toggle-debug-on-error -f publish-website
	@cp -r css .public/

clean:
	@rm -f ./.public

.PHONY: all build
