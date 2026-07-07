class Pathguard < Formula
  desc "CLI that flags NFD filename/path byte-lengths risking cloud/NAS sync"
  homepage "https://github.com/msjang/pathguard"
  version "0.1.0"

  on_macos do
    url "https://github.com/msjang/pathguard/releases/download/v#{version}/pathguard-cli-macos-universal.zip"
    sha256 "1f32fce55b7d193b48a1df12f60f1528fad46697cfd4454944ff1e62bb911074"
  end

  on_linux do
    on_arm do
      url "https://github.com/msjang/pathguard/releases/download/v#{version}/pathguard-linux-arm64.tar.gz"
      sha256 "4c0da9c62a6fd73d76336eba1e1bf31d726e84a9268802965460b9e78b678e8b"
    end
    on_intel do
      url "https://github.com/msjang/pathguard/releases/download/v#{version}/pathguard-linux-amd64.tar.gz"
      sha256 "5c7a139baa26eee9129ee35bd67e392511e3947d3a786260b15cfa01603fa346"
    end
  end

  def install
    bin.install "pathguard"
  end

  test do
    system bin/"pathguard", "--root", testpath, "--json"
  end
end
