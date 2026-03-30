class Learnloop < Formula
  desc "CLI for the LearnLoop platform — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v2.0.0/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v2.0.0/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v2.0.0/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  def install
    bin.install "learnloop"
    bin.install "ll"
  end

  test do
    assert_match "LearnLoop platform CLI", shell_output("#{bin}/learnloop --help")
    assert_match version.to_s, shell_output("#{bin}/learnloop --version")
    assert_match "LearnLoop platform CLI", shell_output("#{bin}/ll --help")
  end
end
