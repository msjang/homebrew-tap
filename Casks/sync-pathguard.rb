cask "sync-pathguard" do
  version "0.1.0"
  arch arm: "arm64", intel: "amd64"

  on_arm do
    sha256 "REPLACE_WITH_arm64_zip_sha256"
  end
  on_intel do
    sha256 "REPLACE_WITH_amd64_zip_sha256"
  end

  url "https://github.com/msjang/sync-pathguard/releases/download/v#{version}/Sync-Pathguard-macos-#{arch}.zip"
  name "Sync Pathguard"
  desc "Menu-bar guard for NFD filename lengths that break cloud/NAS sync"
  homepage "https://github.com/msjang/sync-pathguard"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Sync Pathguard.app"

  # Stopgap for the unsigned build: clear the quarantine flag so Gatekeeper
  # allows launch. Remove once the app is signed & notarized.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Sync Pathguard.app"]
  end

  zap trash: [
    "~/Library/Application Support/sync-pathguard",
  ]
end
