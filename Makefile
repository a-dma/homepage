MAKEFLAGS += --no-builtin-rules

all: deps version build

deps:
	@git clone https://code.orgmode.org/bzg/org-mode.git /opt/buildhome/org-mode
	@$(MAKE) -C /opt/buildhome/org-mode autoloads

build:
	@emacs --batch -l publish.el -f toggle-debug-on-error -f publish-website
	@cp -r css .public/

version:
	@emacs --version
	@emacs --batch -l publish.el -f org-version

clean:
	@rm -rf ./.public

.PHONY: all deps build version
