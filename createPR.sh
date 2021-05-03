BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD);
git push -u origin "${BRANCH_NAME}" || true;
hub pull-request --no-edit || true;
