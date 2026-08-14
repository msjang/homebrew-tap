class Pathguard < Formula
  desc "CLI that flags NFD filename/path byte-lengths risking cloud/NAS sync"
  homepage "https://github.com/msjang/pathguard"
  version "0.1.2"

  on_macos do
    url "https://github.com/msjang/pathguard/releases/download/v#{version}/pathguard-cli-macos-universal.zip"
    sha256 "32b065a72672f3975c790bfd5dfcd3a1187a963feccc0508d2911be79f720b95"
  end

  on_linux do
    on_arm do
      url "https://github.com/msjang/pathguard/releases/download/v#{version}/pathguard-linux-arm64.tar.gz"
      sha256 "d10e2ba20cb62b2a734e3e0a96f987c099c6b1d69e6501d7ad252c990f08fb45"
    end
    on_intel do
      url "https://github.com/msjang/pathguard/releases/download/v#{version}/pathguard-linux-amd64.tar.gz"
      sha256 "c0cef7d4343b425126fb9072f79a024a96a5de7357460d0e4ae826594b713e5f"
    end
  end

  def install
    bin.install "pathguard"
  end

  test do
    system bin/"pathguard", "--root", testpath, "--json"
  end
end
