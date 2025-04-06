BUILD_DIR     = ./build
APP_NAME      = Pullse
ARCHIVE_PATH  = $(BUILD_DIR)/$(APP_NAME).xcarchive
CONFIGURATION = Release
BUILD_LOG     = ./build.log

.PHONY: build
build: clean
	xcodebuild build analyze archive \
		-destination "generic/platform=macOS" \
		-scheme $(APP_NAME) \
		-configuration $(CONFIGURATION) \
		-archivePath $(ARCHIVE_PATH) \
		| tee $(BUILD_LOG)

.PHONY: swiftlint-analyze
swiftlint-analyze:
	$(MAKE) build CONFIGURATION=Debug
	swiftlint analyze --strict --compiler-log-path $(BUILD_LOG)

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

# TODO: notary

.PHONY: schema
schema:
	curl -sSfLo Pullse/Github/schema.graphqls https://docs.github.com/public/fpt/schema.docs.graphql

.PHONY: clean-generated
clean-generated:
	rm -rf Pullse/Github/{Github.graphql.swift,Operations,Schema}

.PHONY: generate
generate: clean-generated
	./apollo-ios-cli generate

.PHONY: incr-ver
incr-ver:
	xcrun agvtool next-version
