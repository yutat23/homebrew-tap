class Lsoff < Formula
  desc "CLI/TUI for listing listening TCP/UDP ports"
  homepage "https://github.com/yutat23/lsoff"
  url "https://github.com/yutat23/lsoff/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "78f1b4b5bd87e891442ad55aba0caa3b940d5f91afe433d83c88d8865676336a"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "."
  end

  test do
    assert_match "lsoff #{version}", shell_output("#{bin}/lsoff --version")
  end
end
