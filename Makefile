MAKEFLAGS += --no-builtin-rules

all: build

build:
	@emacs --batch -q --load publish.el -f toggle-debug-on-error -f publish-website

clean:
	@rm -f ./public

.PHONY: all build
