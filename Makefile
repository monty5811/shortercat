SHELL := bash

RED := $(shell tput setaf 1)
GREEN := $(shell tput setaf 2)
YELLOW := $(shell tput setaf 3)
BOLD := $(shell tput bold)
NORMAL := $(shell tput sgr0)

NODE_ENV?=

colours:
	@echo "$(BOLD)BOLD $(RED)RED $(GREEN)GREEN $(YELLOW)YELLOW $(NORMAL)"

src/TW.elm: dist ./src/main.css postcss.config.js package.json
	@echo "$(GREEN)Building src/TW.elm$(NORMAL)"
	@yarn css-prebuild

dist:
	@mkdir dist

dist/icons:
	@cp -R src/icons dist/icons

dist/robots.txt: dist
	@touch dist/robots.txt

dist/sitemap.xml: dist
	@python sitemap.py

dist/data: dist
	@cp -R data dist/data

dist/main.css: dist
	@yarn run --silent css-build

dist/elm.js: src/TW.elm dist src/*.elm
	@echo "$(GREEN)Compiling elm$(NORMAL)"
	yarn run --silent elm-make

dist/elm.min.js: dist/elm.js
ifdef NODE_ENV
	@echo "$(GREEN)Compressing elm$(NORMAL)"
	@yarn run --silent elm-min
else
	@echo "$(YELLOW)Skipping: Compressing elm$(NORMAL)"
	cp dist/elm.js dist/elm.min.js
endif

dist/manifest.webmanifest: dist
	@cp ./src/manifest.webmanifest dist/

dist/index.html: dist/elm.min.js \
	dist/main.css \
	dist/icons\
	dist/manifest.webmanifest\
	dist/data
	@cp index.html dist/index.html

pre-sw: dist/index.html
	./hash.sh
	@rm -f dist/elm.js dist/elm.min.js dist/main.css

sw: pre-sw
	@echo "$(GREEN)Building service worker$(NORMAL)"
	@yarn run --silent sw

elm-format:
	yarn run --silent elm-format

dist_ext:
	@mkdir dist_ext

ext:
	@cp -R ext dist_ext
	@cp -R src/icons/* dist_ext

build: dist/index.html sw

clean:
	@rm -r dist/
	@rm -f src/TW.elm

serve:
	cd dist && python -m http.server 4001

watch:
	find src | entr -c make dist/index.html
