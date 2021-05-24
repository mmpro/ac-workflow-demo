#BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD);
#git push -u origin "${BRANCH_NAME}" || true;

CURRENT_BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

echo "Pushing $CURRENT_BRANCH to Github"
git push -u origin "${CURRENT_BRANCH}" --quiet  > /dev/null

PR=$(gh pr create --base develop --fill --draft)
PRID=${PR##*/}
echo "Pull Request ID $PRID"

set -e
source .jenkins.conf

URL="https://$JENKINS_USER:$JENKINS_USER_TOKEN@$JENKINS_URL/job/$JENKINS_JOB/buildWithParameters?token=$JENKINS_TOKEN&branch=$CURRENT_BRANCH&prid=$PRID"
HTTP_STATUS=$(curl --write-out %{http_code} --silent --output /dev/null $URL)

echo ""
echo "----------------------------------------------------------------"
if [ "$HTTP_STATUS" = "201" ]
then
  TIME=$(date +%Y-%m-%d)" "$(date +%H:%M:%S)
  echo "Jenkins has been started on $TIME - you will be informed via MS Teams."
else
  echo "The job has not been started."
  echo "Jenkins responded with status code $HTTP_STATUS"
  echo ""
  echo "Please check your credentials and the project token."
fi
echo "----------------------------------------------------------------"
echo ""