cask "pathguard" do
  version "0.1.2"
  sha256 "358c7d6fc816a3126e7636c1933d30e098a7e4980020b73d41d2f936e1ad4f6f"

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

  # The app can install a LaunchAgent (Launch at login) and, since 0.1.2, the
  # config may live in ~/.config instead of Application Support — zap both.
  zap trash: [
    "~/.config/pathguard",
    "~/Library/Application Support/pathguard",
    "~/Library/LaunchAgents/io.github.msjang.pathguard.plist",
  ]
end
