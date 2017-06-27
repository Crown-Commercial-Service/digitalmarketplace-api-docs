.PHONY: requirements
requirements:
	npm install
	bundle install

.PHONY: html
html:
	./node_modules/widdershins/widdershins.js -r -c -u templates/ -y ${API_SPEC} -o source/index.html.md
	bundle exec middleman build

.PHONY: serve
serve:
	bundle exec middleman server
