class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "2.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v2.6.0-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "b6444f926d20b6e9a8dee622cfa8ceaad5084f060c6fe3615a9514f39982c9f1"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v2.6.0-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "4db7ed329b7a707c6c2d523db699a8a03b59ad7a417cc5ecab3c206b88b2f870"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v2.6.0-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d01ef2dc26534bd869ccc96443f8534d9f064178d94a98e37fb7b5cc64f196a3"
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
