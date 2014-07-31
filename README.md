todos
=========

## Requierment

- node: v0.10.26
	- npm: v1.4.7
- ruby: v1.8.7 (2012-02-08 patchlevel 358) [universal-darwin11.0]
	- compass

## Setup

	bundle install --binstubs --path ruby_modules
	npm install
	export PATH=./bin:./node_modules/.bin:$PATH
	bower install

### start develop

	npm start

### append client library

	bower install -D [lib]

