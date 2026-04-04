class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "2.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v2.8.0-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "4e91c137a051c53e15b7011f127fb9821f7d687b0164c6e52a2f0110cbf63a44"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v2.8.0-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "acbdec9fc3ade5c8d975f580f2123645a71a7c46a131ca2d080624e0e1bc863f"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v2.8.0-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e34be988d4343f1a72753fe540cb56752dc878a38282b1ca74ac8ec2d2f7120a"
  end

  def install
    bin.install "learnloop-beta"
    bin.install "ll-beta"

  end

  test do
    assert_match "LearnLoop platform CLI", shell_output("#{bin}/learnloop-beta --help")
    assert_match version.to_s, shell_output("#{bin}/learnloop-beta --version")
    assert_match "LearnLoop platform CLI", shell_output("#{bin}/ll-beta --help")
  end
end
