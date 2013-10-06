.PHONY: build clean setup html css js

build: setup html css js

dev: setup html-dev css js-dev

setup: node_modules/uglify-js node_modules/less

clean:
	rm -f dist/index.html
	rm -rf dist/css
	rm -rf dist/js


js-dev: dist/js
	cp src/js/fishbone.js dist/js
	cp src/js/leeq.js dist/js

js: dist/js
	./node_modules/uglify-js/bin/uglifyjs src/js/fishbone.js src/js/leeq.js > dist/js/leeq.js

html:
	cat src/html/index.html | grep -v 'make:dev' > dist/index.html

html-dev:
	cat src/html/index.html | grep -v 'make:build'  > dist/index.html

css: dist/css/leeq.css

dist/css/leeq.css: dist/css
	./node_modules/less/bin/lessc src/less/* > dist/css/leeq.css

node_modules/uglify-js:
	npm install uglify-js

node_modules/less:
	npm install less

dist/js:
	mkdir -p dist/js

dist/css:
	mkdir -p dist/css
