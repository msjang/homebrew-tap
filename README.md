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
| [nextboot](https://github.com/msjang/nextboot) | Cask (app) | `brew install --cask nextboot` | Menu-bar switcher for which macOS volume boots next (Intel only) |
| [nextboot](https://github.com/msjang/nextboot) | Formula (CLI) | `brew install nextboot` | CLI version of the above (`bless --nextonly`, scriptable) |

<!-- Add a row per new package. Casks/<name>.rb for apps, Formula/<name>.rb for CLIs. -->

## Notes

- The `pathguard` and `nextboot` casks clear the quarantine flag after install,
  since both apps are **unsigned** (Gatekeeper would otherwise block them).
  pathguard expects to be signed eventually; nextboot does not plan to.
- `nextboot` is **Intel-only** and refuses to install elsewhere. It drives
  `bless --nextonly`, an EFI facility with no Apple Silicon equivalent.

## Maintainer

On each upstream release, bump `version` + `sha256` in the relevant `Casks/` or
`Formula/` file.

pathguard:

```bash
VER=0.1.1
base="https://github.com/msjang/pathguard/releases/download/v$VER"
for f in Pathguard-macos-universal.zip pathguard-cli-macos-universal.zip \
         pathguard-linux-amd64.tar.gz pathguard-linux-arm64.tar.gz; do
  echo "$f  $(curl -sL "$base/$f" | shasum -a 256 | cut -d' ' -f1)"
done
```

nextboot:

```bash
VER=0.1.1
base="https://github.com/msjang/nextboot/releases/download/v$VER"
for f in nextboot-macos-amd64.zip nextboot-cli-macos-amd64.zip; do
  echo "$f  $(curl -sL "$base/$f" | shasum -a 256 | cut -d' ' -f1)"
done
```
