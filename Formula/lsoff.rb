class Lsoff < Formula
  desc "CLI/TUI for listing listening TCP/UDP ports"
  homepage "https://github.com/yutat23/lsoff"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.6/lsoff-darwin-arm64"
      sha256 "509d9dac4ccc67ad287dcfd719e52b2fa4a893217097628777974c139d23e7e1"
    end
    on_intel do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.6/lsoff-darwin-amd64"
      sha256 "53ac922e985dfcace432ad79f0e75452b384e18da414a8d2bc2ce19efd76c977"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.6/lsoff-linux-arm64"
      sha256 "a1d50684fe50fc17418b3cbf12bf514042142796b9dad386d317982752a0e360"
    end
    on_intel do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.6/lsoff-linux-amd64"
      sha256 "e720e2e12ebe76df450810321ba2e2f2c509d1acdeef37658d4cbbb2b384e733"
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
