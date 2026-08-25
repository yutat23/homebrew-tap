class Lsoff < Formula
  desc "CLI/TUI for listing listening TCP/UDP ports"
  homepage "https://github.com/yutat23/lsoff"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.4/lsoff-darwin-arm64"
      sha256 "06f1b5cc4d28204520e197311d9eaf535ba922ff0747466f569f37743731f66d"
    end
    on_intel do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.4/lsoff-darwin-amd64"
      sha256 "b537b6ff7b199921736d460a5d5b166c6d9d268a7e8ed866aec532018bb228cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.4/lsoff-linux-arm64"
      sha256 "e491f0bd2e4699277e6bc5a8ed84a24fae7b996588be2097f41a06552b060830"
    end
    on_intel do
      url "https://github.com/yutat23/lsoff/releases/download/v0.1.4/lsoff-linux-amd64"
      sha256 "7f909c43d9427f2f518804fd9abf7dea6b792df59dfbed9d5b9573f42ea2c38e"
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
