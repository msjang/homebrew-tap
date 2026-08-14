cask "nextboot" do
  version "0.1.1"
  sha256 "2024c0d0422c27d2394ff4022e6c1936b331a5094a75b8531f8c72a3fa4db4c0"

  url "https://github.com/msjang/nextboot/releases/download/v#{version}/nextboot-macos-amd64.zip"
  name "nextboot"
  desc "Menu-bar switcher for which macOS volume boots next"
  homepage "https://github.com/msjang/nextboot"

  # bless --nextonly is an EFI facility; Apple Silicon has no equivalent.
  depends_on arch: :x86_64
  depends_on macos: :big_sur

  livecheck do
    url :url
    strategy :github_latest
  end

  app "nextboot.app"

  # Stopgap for the unsigned build: clear the quarantine flag so Gatekeeper
  # allows launch. The project does not plan to sign (upstream ADR-0010), so
  # this stays until that changes.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/nextboot.app"]
  end

  zap trash: [
    "~/.config/nextboot",
    "~/Library/Application Support/nextboot",
  ]
end
