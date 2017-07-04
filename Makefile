.PHONY: requirements
requirements:
	git worktree add build gh-pages
	npm install
	bundle install

.PHONY: setup
setup:
	git worktree add build gh-pages

.PHONY: clean
clean:
	rm -rf build
	git worktree prune

.PHONY: html
html:
	$(if ${API_SPEC},,$(error Must specify path to the OpenAPI spec file in API_SPEC))
	./node_modules/widdershins/widdershins.js -r -c -u templates/ -y ${API_SPEC} -o source/index.html.md
	bundle exec middleman build

.PHONY: server
server:
	bundle exec middleman server

.PHONY: publish
publish: html
	$(eval export LATEST_TAG=$(shell git describe --always))
	cd build && git add . && git commit --allow-empty -m "Publish documentation from ${LATEST_TAG}"
	cd build && git push origin gh-pages
