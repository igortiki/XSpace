.DEFAULT_GOAL := help

PROJECT := App/XSpace.xcodeproj
SCHEME  := XSpace
SIM     := platform=iOS Simulator,name=iPhone 16

.PHONY: help bootstrap project build test server clean

help: ## показать доступные команды
	@grep -E "^[a-z-]+:.*##" $(MAKEFILE_LIST) | sed "s/:.*## /\t/"

bootstrap: ## поставить инструменты
	brew install xcodegen

project: ## сгенерировать и открыть проект
	cd App && xcodegen generate --spec project.yml
	open $(PROJECT)

build: ## собрать приложение
	xcodebuild -project $(PROJECT) -scheme $(SCHEME) -destination "generic/platform=iOS Simulator" build

test: ## прогнать тесты пакета
	cd Packages/XSpaceCore && swift test

clean: ## удалить сгенерированный проект и артефакты
	rm -rf $(PROJECT) Packages/XSpaceCore/.build
