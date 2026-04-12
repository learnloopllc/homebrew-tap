class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "3.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v3.4.0-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "d88177cbed3dada1c1f4f3e5e1adc96760abddb68bca2bd79019d1207cb5c9bc"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v3.4.0-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "4ea33a733e4ef311fd44bf73131daf10d95bb67d633e1a676da0ba774693c550"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v3.4.0-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a9d38bc49b5ca3f9575abc1515131cbced281170b04b4fb973d96c5fa0a1e8a3"
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
