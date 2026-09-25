.DEFAULT_GOAL := help

PROJECT := App/XSpace.xcodeproj

.PHONY: help bootstrap project build build-tvos test clean

help: ## list available commands
	@grep -E "^[a-z-]+:.*##" $(MAKEFILE_LIST) | sed "s/:.*## /\t/"

bootstrap: ## install required tools at their pinned versions
	brew install mint
	mint bootstrap

# NOTE: run from the repo root - Mint only looks for Mintfile in the current directory
project: ## generate and open the Xcode project
	mint run xcodegen generate --spec App/project.yml
	open $(PROJECT)

build: ## build the iOS app
	xcodebuild -project $(PROJECT) -scheme XSpace-iOS -destination "generic/platform=iOS Simulator" build

build-tvos: ## build the tvOS app
	xcodebuild -project $(PROJECT) -scheme XSpace-tvOS -destination "generic/platform=tvOS Simulator" build

test: ## run XSpaceCore tests
	cd Packages/XSpaceCore && swift test

clean: ## remove generated project and build artifacts
	rm -rf $(PROJECT) Packages/XSpaceCore/.build
