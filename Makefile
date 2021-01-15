VERSION_FILE=.version
VERSION_STRING=$(shell cat "$(VERSION_FILE)")

.PHONY: get-version set-version git-tag lint publish

get-version:
	@echo $(VERSION_STRING)

set-version:
	$(eval NEW_VERSION := $(filter-out $@,$(MAKECMDGOALS)))
	@echo "$(NEW_VERSION)" > "$(VERSION_FILE)"
	@sed -i '' '/^[[:blank:]]*s.version/ s/'\"'[^'\"'][^'\"']*'\"'/'\"'$(NEW_VERSION)'\"'/' IRLSize.podspec
	$(eval CHANGELOG_URL := "\#\# \[$(NEW_VERSION)\]\(https:\/\/github.com\/Detroit-Labs\/IRLSize\/releases\/tag\/$(NEW_VERSION)\)")
	$(eval CHANGELOG_DATE := "\*\*Released:\*\* `date +"%Y-%m-%d"`")
	@sed -i '' '3s/^/'$(CHANGELOG_URL)'\n'$(CHANGELOG_DATE)'\n\n/' CHANGELOG.md

git-tag:
ifneq ($(strip $(shell git status --untracked-files=no --porcelain 2>/dev/null)),)
	$(error git state is not clean)
endif
	git tag -a "$(VERSION_STRING)" -m "$(VERSION_STRING)"
	git push origin "$(VERSION_STRING)"

lint:
	bundle exec pod spec lint IRLSize.podspec

publish:
	bundle exec pod trunk push IRLSize.podspec

%:
	@:
