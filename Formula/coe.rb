class Coe < Formula
  desc "TCP socket tool for interactive server/client testing"
  homepage "https://github.com/yutat23/coe"
  version "0.1.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yutat23/coe/releases/download/v0.1.10/coe-darwin-arm64"
      sha256 "efdda91d94897e5364d98fc50c732d35fa30d51961f7a759e37b0594262c14b1"
    end
    on_intel do
      url "https://github.com/yutat23/coe/releases/download/v0.1.10/coe-darwin-amd64"
      sha256 "26960af36e1251552e3904770320b64d0f90564ed796ed27a51768fb6a48b348"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yutat23/coe/releases/download/v0.1.10/coe-linux-arm64"
      sha256 "cbe8ee0ae545f9eaf787d382076ba66a97ca8727b8dba4f471e2caf0f933501b"
    end
    on_intel do
      url "https://github.com/yutat23/coe/releases/download/v0.1.10/coe-linux-amd64"
      sha256 "342b230eee799c12ea2d0726f7944961ac540932efb6b46d7b03e35b1569f260"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    binary = "coe-#{os}-#{arch}"
    chmod "+x", binary
    bin.install binary => "coe"
  end

  test do
    assert_match "coe #{version}", shell_output("#{bin}/coe --version")
  end
end
