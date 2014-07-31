todos
=========

## Requierment

- node: v0.10.26
	- npm: v1.4.7
- ruby: v1.9.3p448
	- bundler: v1.5.3

## Setup

	bundle install --binstubs --path ruby_modules
	npm install
	source ./env
	bower install

### start develop

	npm start

### append client library

	source ./env
	bower install -D [lib]

### use grunt task

	source ./env
	grunt [task]
