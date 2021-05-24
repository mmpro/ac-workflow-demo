commit:
	@node ./node_modules/ac-semantic-release/lib/commit.js

test-local:
	@echo "LOCAL TESTING"
	#rm -f error.log
	#DEBUG=ioredis:* npm run test-local
	yarn run test-local

lint-fix:
	./node_modules/.bin/eslint "index.js" --fix

jenkins-test:
	@echo "JENKINS TESTING"
	rm -f error.log
	yarn run test-jenkins

rebase:
	git fetch origin develop
	git rebase origin/develop


.PHONY: check
