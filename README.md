# homebrew-tap

msjang's [Homebrew](https://brew.sh) tap — a single place for my apps and CLI
tools. Each package's full docs live in its own repo; this README is just the
index.

## Usage

Tap once, then install anything below:

```bash
brew tap msjang/tap
```

## Packages

| Package | Type | Install | What it is |
|---|---|---|---|
| [pathguard](https://github.com/msjang/pathguard) | Cask (app) | `brew install --cask pathguard` | Menu-bar guard for NFD filename lengths that break cloud/NAS sync |
| [pathguard](https://github.com/msjang/pathguard) | Formula (CLI) | `brew install pathguard` | CLI version of the above (scriptable, CI-friendly) |

<!-- Add a row per new package. Casks/<name>.rb for apps, Formula/<name>.rb for CLIs. -->

## Notes

- The `pathguard` cask clears the quarantine flag after install, since the
  app is currently **unsigned** (Gatekeeper would otherwise block it).

## Maintainer

On each upstream release, bump `version` + `sha256` in the relevant `Casks/` or
`Formula/` file. For pathguard:

```bash
VER=0.1.0
base="https://github.com/msjang/pathguard/releases/download/v$VER"
for f in Pathguard-macos-arm64.zip Pathguard-macos-amd64.zip \
         pathguard-macos-arm64.zip pathguard-macos-amd64.zip \
         pathguard-linux-amd64.tar.gz pathguard-linux-arm64.tar.gz; do
  echo "$f  $(curl -sL "$base/$f" | shasum -a 256 | cut -d' ' -f1)"
done
```
