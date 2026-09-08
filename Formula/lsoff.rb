class Lsoff < Formula
  desc "CLI/TUI for listing listening TCP/UDP ports"
  homepage "https://github.com/yutat23/lsoff"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.5/lsoff-darwin-arm64"
      sha256 "bd3277997aaccc8cb29f2d31e93bb4a3657c5d617a5fd774c759e92395db518d"
    end
    on_intel do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.5/lsoff-darwin-amd64"
      sha256 "c32bcaa94cfb470e1d66c6fd3d0ebacb2f12e77636b4f9e22d45b47175225b30"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.5/lsoff-linux-arm64"
      sha256 "a7840e153b099addaac4fe6196b2bad053257d9e6c2ad18fa123eb19e66e18c8"
    end
    on_intel do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.5/lsoff-linux-amd64"
      sha256 "f1fc6300703fdd08be355b9fc957ed6867827678abe6ebec9746be612cdb1e14"
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
