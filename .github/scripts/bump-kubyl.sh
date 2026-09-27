#!/usr/bin/env bash
# Bumps Casks/kubyl.rb to the latest upstream release, if any, and opens a PR.
#
# Unlike silo's formula (four url/sha256 pairs across on_macos/on_linux blocks), kubyl's cask
# has a single universal .dmg with one url/sha256 pair — the shape `brew bump-cask-pr`
# understands natively, so no by-hand sed here.
set -euo pipefail

CASK="kubyl"
UPSTREAM_REPO="BirknerAlex/kubyl"

current_version=$(awk -F'"' '/^  version /{print $2; exit}' "Casks/$CASK.rb")
latest_tag=$(gh api "repos/${UPSTREAM_REPO}/releases/latest" --jq .tag_name)
latest_version=${latest_tag#v}

if [ -z "$current_version" ]; then
  echo "::error::could not determine current version from Casks/$CASK.rb"
  exit 1
fi

if [ "$latest_version" = "$current_version" ]; then
  echo "kubyl is up to date at $current_version"
  exit 0
fi

echo "Bumping $CASK $current_version -> $latest_version"

gh auth setup-git
git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

brew bump-cask-pr --no-browse --no-fork --version="$latest_version" "birkneralex/homebrew-tap/$CASK"
