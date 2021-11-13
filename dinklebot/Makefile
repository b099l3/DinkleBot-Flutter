SHELL := /bin/bash

.PHONY: \
	gen
	watch
	get
	clean

watch:
	@fvm flutter pub run build_runner watch --delete-conflicting-outputs

gen:
	@fvm flutter pub run build_runner build --delete-conflicting-outputs

get:
	@fvm flutter pub get

clean:
	@fvm flutter clean
