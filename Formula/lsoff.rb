class Lsoff < Formula
  desc "CLI/TUI for listing listening TCP/UDP ports"
  homepage "https://github.com/yutat23/lsoff"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.2/lsoff-darwin-arm64"
      sha256 "eb35ab6adde95662639a9d0abbb9a98714449921c41a62882ce9e30d8c9c905e"
    end
    on_intel do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.2/lsoff-darwin-amd64"
      sha256 "023eb564282544353c6629b2b20cf30a50b39487f7c4ba47afe88908791f11c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.2/lsoff-linux-arm64"
      sha256 "9b601a0e8504dd88e16dc20e060ff588c21fbec8e46c5f23c5e4c627b39180e2"
    end
    on_intel do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.2/lsoff-linux-amd64"
      sha256 "fe26256344c723262c9652b3f3ab5e99ae4e837135f4a92e24440ad7b713756b"
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
