#!/usr/bin/env bash
# Bumps Formula/silo.rb to the latest upstream release, if any, and opens a PR.
#
# brew bump-formula-pr (and the Homebrew/actions/bump-packages action that
# wraps it) only understands formulae with a single top-level `url` stanza.
# silo's formula uses on_macos/on_linux blocks with four separate
# url/sha256 pairs, which that tooling can't update, so we do it by hand.
set -euo pipefail

FORMULA="Formula/silo.rb"
UPSTREAM_REPO="BirknerAlex/silo"
TARGETS=(
  aarch64-apple-darwin
  x86_64-apple-darwin
  aarch64-unknown-linux-musl
  x86_64-unknown-linux-musl
)

current_version=$(sed -nE "s#.*silo-v([0-9.]+)-${TARGETS[0]}\.tar\.gz.*#\1#p" "$FORMULA" | head -1)
latest_tag=$(gh api "repos/${UPSTREAM_REPO}/releases/latest" --jq .tag_name)
latest_version=${latest_tag#v}

if [ -z "$current_version" ]; then
  echo "::error::could not determine current version from $FORMULA"
  exit 1
fi

if [ "$latest_version" = "$current_version" ]; then
  echo "silo is up to date at $current_version"
  exit 0
fi

branch="bump-silo-${latest_version}"
if [ -n "$(gh pr list --head "$branch" --state open --json number -q '.[0].number')" ]; then
  echo "PR for $branch already exists, nothing to do"
  exit 0
fi

echo "Bumping silo $current_version -> $latest_version"

# Old shas are captured up front (they identify each target's block) so the
# later version-string replacement, which also touches the download-URL
# path segment, doesn't affect how we look them up. Plain indexed arrays
# only (no associative arrays) since macOS runners' default /bin/bash is 3.2.
old_shas=()
for target in "${TARGETS[@]}"; do
  old_sha=$(grep -A1 -- "-${target}\.tar\.gz\"" "$FORMULA" | grep sha256 | sed -E 's/.*sha256 "([a-f0-9]+)".*/\1/')
  if [ -z "$old_sha" ]; then
    echo "::error::could not find existing sha256 for target $target in $FORMULA"
    exit 1
  fi
  old_shas+=("$old_sha")
done

sed -i '' "s/v${current_version}/v${latest_version}/g" "$FORMULA"

for i in "${!TARGETS[@]}"; do
  target="${TARGETS[$i]}"
  asset="silo-v${latest_version}-${target}.tar.gz"
  sha=$(curl -sL --fail "https://github.com/${UPSTREAM_REPO}/releases/download/${latest_tag}/${asset}.sha256" | awk '{print $1}')
  if [ -z "$sha" ]; then
    echo "::error::missing checksum for $asset"
    exit 1
  fi
  sed -i '' "s/${old_shas[$i]}/${sha}/" "$FORMULA"
done

echo "Validating bumped formula"
brew style --formula "birkneralex/tap/silo"
brew audit --strict --online "birkneralex/tap/silo"
brew install --formula "birkneralex/tap/silo"
brew test "birkneralex/tap/silo"

gh auth setup-git
git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git checkout -b "$branch"
git commit -am "silo: ${current_version} -> ${latest_version}"
git push -u origin "$branch"

gh pr create \
  --title "silo: ${current_version} -> ${latest_version}" \
  --body "Bumps silo to [${latest_tag}](https://github.com/${UPSTREAM_REPO}/releases/tag/${latest_tag})." \
  --head "$branch" \
  --base main
