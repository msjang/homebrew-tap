cask "pathguard" do
  version "0.1.1"
  sha256 "450a41ac54ff990c6570668a622d1644a833c22e13e7f9f1854f742377e68b6b"

  url "https://github.com/msjang/pathguard/releases/download/v#{version}/Pathguard-macos-universal.zip"
  name "Pathguard"
  desc "Menu-bar guard for NFD filename lengths that break cloud/NAS sync"
  homepage "https://github.com/msjang/pathguard"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Pathguard.app"

  # Stopgap for the unsigned build: clear the quarantine flag so Gatekeeper
  # allows launch. Remove once the app is signed & notarized.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Pathguard.app"]
  end

  zap trash: [
    "~/Library/Application Support/pathguard",
  ]
end
