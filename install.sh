#!/bin/bash

VERSION="${KTLINT_VERSION:-latest}"

TEMP="${KTLINT_TEMPDIR}"
if [ -z "${TEMP}" ]; then
  if [ -n "${RUNNER_TEMP}" ]; then
    TEMP="${RUNNER_TEMP}"
  else
    TEMP="$(mktemp -d)"
  fi
fi

mkdir -p "${TEMP}/ktlint/bin"

RELEASE_URL="https://api.github.com/repos/pinterest/ktlint/releases/tags/${VERSION}"
if [ "${VERSION}" == "latest" ] ; then
    RELEASE_URL="https://api.github.com/repos/pinterest/ktlint/releases/latest"
fi

echo "::group::🧹 Installing ktlint ${VERSION} ... https://github.com/pinterest/ktlint"
curl -ssL $RELEASE_URL | jq '.assets | .[] | select(.name == "ktlint") | .browser_download_url' | wget -qi -
chmod a+x ktlint
mv ktlint "${TEMP}/ktlint/bin"
echo '::endgroup::'

echo "${TEMP}/ktlint/bin" >>"${GITHUB_PATH}"