class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "2.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v2.9.0-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "d9f04ee84bac9d8e37549909fa3ec2542da7bcb9370c52ed6f9d3f81f9b473c4"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v2.9.0-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "6eba0cc321ce35bda0b591efa594b3509371183003894321ba0060bec9e04610"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v2.9.0-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7e5035319960c05ab5cb3a5e58be7dc1703e5cd6eb8cdfedaef8dd44b1b0d3f4"
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
