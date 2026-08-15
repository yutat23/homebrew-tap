class Lsoff < Formula
  desc "CLI/TUI for listing listening TCP/UDP ports"
  homepage "https://github.com/yutat23/lsoff"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.3/lsoff-darwin-arm64"
      sha256 "48a12de5994d0cbd1a26829db4821c20a35444b8c3269b073250d84ce466d49c"
    end
    on_intel do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.3/lsoff-darwin-amd64"
      sha256 "6fab07670d3c27789ff78ce950bb53f86a2ddd3f06a2314f424e1fbf0120ba2b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.3/lsoff-linux-arm64"
      sha256 "9f502f77375e2e021e09e216ad8a964e913fe38982f2b105aae65a8d46fd5b8e"
    end
    on_intel do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.3/lsoff-linux-amd64"
      sha256 "9bb5fa64a59ee05243728931796e059b9e0bcaecf1c3059ee884f6e98ca54857"
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
