TEST_REPO = MakeToTask-test2
TEST_REMOTE_REPO = upstream
TEST_GITHUB_ENV = TEST_ENV_VAR
GITHUB_USER = $(shell gh config get -h github.com user || echo unknown)

.PHONY: show-installation
show-installation:
	@if [ -x "$(command -v gh)" ]; then \
		echo "github cli seems to be not installed. Please see https://github.com/cli/cli";\
	fi

.PHONY: clean
clean: delete-repo-env delete-test-repo
	@gh auth logout

STATUS = $(shell gh auth status)
.PHONY: login
login: show-installation
	@if [ -z "$(STATUS)" ]; then \
		gh auth login -h github.com -s delete_repo || exit 0; \
	fi

.PHONY: create-test-repo
create-test-repo: login
	@gh repo create $(TEST_REPO) --private --source=. --remote=$(TEST_REMOTE_REPO) || exit 0

.PHONY: delete-test-repo
delete-test-repo: login
	@gh repo delete $(TEST_REPO) --yes; \
	git remote remove $(TEST_REMOTE_REPO) || exit 0

.PHONY: set-repo-env
set-repo-env: create-test-repo
	@gh secret --repo $(GITHUB_USER)/$(TEST_REPO) set $(TEST_GITHUB_ENV) -b "test-value"

.PHONY: delete-repo-env
delete-repo-env:
	@gh secret --repo $(GITHUB_USER)/$(TEST_REPO) delete $(TEST_GITHUB_ENV) || exit 0
