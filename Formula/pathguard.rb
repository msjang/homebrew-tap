class Pathguard < Formula
  desc "CLI that flags NFD filename/path byte-lengths risking cloud/NAS sync"
  homepage "https://github.com/msjang/pathguard"
  version "0.1.1"

  on_macos do
    url "https://github.com/msjang/pathguard/releases/download/v#{version}/pathguard-cli-macos-universal.zip"
    sha256 "f5dee086c84140d2a95eea83074fd39f23e0af1171693b5d7952e6827c82cddd"
  end

  on_linux do
    on_arm do
      url "https://github.com/msjang/pathguard/releases/download/v#{version}/pathguard-linux-arm64.tar.gz"
      sha256 "101ab1caea4d459867d9f83dea8b96881e92ea0b4724a008fbb5b2559c072f9a"
    end
    on_intel do
      url "https://github.com/msjang/pathguard/releases/download/v#{version}/pathguard-linux-amd64.tar.gz"
      sha256 "c5550ca8cabb19505aa886d5c7c32a5a3cf077fd150c1b62ff78ab42e3b716fd"
    end
  end

  def install
    bin.install "pathguard"
  end

  test do
    system bin/"pathguard", "--root", testpath, "--json"
  end
end
