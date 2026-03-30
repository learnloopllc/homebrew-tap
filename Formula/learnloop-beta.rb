class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v2.2.0-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "fd51ad5d8692200f39d9fd124c49871eb6482175018810909dc11a5bc27cdd7c"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v2.2.0-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "171831d07b2aeaa1591266d82785df7006050084b8b19d82504853f73da95cbc"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v2.2.0-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "94d74fa6069753205a4e109202b32babad220224c3257bc955cb3bd008210239"
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
