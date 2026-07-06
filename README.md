# homebrew-tap

Homebrew tap for [Sync Pathguard](https://github.com/msjang/sync-pathguard) —
a menu-bar/CLI guard for NFD filename lengths that break cloud/NAS sync.

## Install

```bash
brew tap msjang/tap
brew install --cask sync-pathguard   # menu-bar app
brew install pathguard               # CLI
```

The cask clears the quarantine flag after install, since the app is currently
**unsigned** (Gatekeeper would otherwise block it).

## Maintainer notes

On each new `sync-pathguard` release, bump `version` and the `sha256` values in
`Casks/sync-pathguard.rb` and `Formula/pathguard.rb`. Get the hashes with:

```bash
VER=0.1.0
base="https://github.com/msjang/sync-pathguard/releases/download/v$VER"
for f in Sync-Pathguard-macos-arm64.zip Sync-Pathguard-macos-amd64.zip \
         pathguard-macos-arm64.zip pathguard-macos-amd64.zip \
         pathguard-linux-amd64.tar.gz pathguard-linux-arm64.tar.gz; do
  echo "$f  $(curl -sL "$base/$f" | shasum -a 256 | cut -d' ' -f1)"
done
```

> The `REPLACE_WITH_*` placeholders must be filled from a real release before
> `brew install` works.
