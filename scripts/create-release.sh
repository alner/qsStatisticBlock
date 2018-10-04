#!/bin/bash
set -o errexit

echo "Contents of zip-file:"
ls -l deploy
echo "Bumping version from: $(scripts/print-version.sh $1 $2)"
VERSION="$(scripts/bump-version.sh $1 $2)"
echo "to: $VERSION"
$HOME/bin/ghr -t ${ghoauth} -u ${CIRCLE_PROJECT_USERNAME} -r ${CIRCLE_PROJECT_REPONAME} -c ${CIRCLE_SHA1} -delete ${VERSION} "./deploy/$2.zip"


# Usage
# $ create-release.sh qlik-oss qsSimpleKPI