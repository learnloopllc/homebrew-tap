class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "2.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v2.3.1-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "700719a6079e667459b28a1cddf98fbaaf23a921a23f6350bd4fb9b030e0da32"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v2.3.1-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "209f3f0860f19e15bb9caf952c9703d25189ccbdfc068af68331995f74dd93b6"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v2.3.1-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "79f29093c9cc9898566025a38a89287be8500d8057cdb16b351d325b56fe22f5"
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
