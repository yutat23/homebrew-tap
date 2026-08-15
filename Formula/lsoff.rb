class Lsoff < Formula
  desc "CLI/TUI for listing listening TCP/UDP ports"
  homepage "https://github.com/yutat23/lsoff"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.1/lsoff-darwin-arm64"
      sha256 "f2d000b6d0e428978a7657dde193416eea2bc92c97ffe521db8d2ef95b522169"
    end
    on_intel do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.1/lsoff-darwin-amd64"
      sha256 "e632c78f9ba4ea518ead549160602038d5445e859bee2312b67b177ab3e1dda7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.1/lsoff-linux-arm64"
      sha256 "c3a625222613f9fe8c23e000d0e05b177dea65c92cdda5f5b80ffeb36d6825df"
    end
    on_intel do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.1/lsoff-linux-amd64"
      sha256 "c8a6adb6ff0b5f949360532cfb43a6d5a7c613edd526696f7fe23494af9b6888"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    binary = "lsoff-#{os}-#{arch}"
    chmod "+x", binary
    bin.install binary => "lsoff"
  end

  test do
    assert_match "lsoff #{version}", shell_output("#{bin}/lsoff --version")
  end
end
