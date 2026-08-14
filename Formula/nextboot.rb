class Nextboot < Formula
  desc "CLI for choosing which macOS volume boots next (bless --nextonly)"
  homepage "https://github.com/msjang/nextboot"
  version "0.1.1"

  url "https://github.com/msjang/nextboot/releases/download/v#{version}/nextboot-cli-macos-amd64.zip"
  sha256 "123fa8f81911dad6ffbafce64509ca1860c778a623ddb15ca01e9c6955c71ea9"

  # bless --nextonly is an EFI facility; Apple Silicon has no equivalent.
  depends_on arch: :x86_64
  depends_on :macos

  def install
    bin.install "nextboot"
  end

  test do
    assert_match "nextboot", shell_output("#{bin}/nextboot --help")
  end
end
