.PHONY: all clean setup html css js

all: setup dist/js dist/css html css js

setup: node_modules/uglify-js node_modules/less

clean:
	rm -f dist/index.html
	rm -rf dist/css
	rm -rf dist/js

js: dist/js
	./node_modules/uglify-js/bin/uglifyjs src/js/laeq.js > dist/js/laeq.js

html:
	cp src/html/index.html dist/index.html

css: dist/css/laeq.css

dist/css/laeq.css: dist/css
	./node_modules/less/bin/lessc src/less/* > dist/css/laeq.css

node_modules/uglify-js:
	npm install uglify-js

node_modules/less:
	npm install less

dist/js:
	mkdir dist/js

dist/css:
	mkdir dist/css
