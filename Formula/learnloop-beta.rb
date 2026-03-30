class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "2.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v2.5.0-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "c9678dbaf9fe88c384d66dce1f8247c97ae5987c2f3b1ddd03d5c4de0fc5c274"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v2.5.0-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "fced8a192a631e0ad291e94db6fce2d9e8e36fd571029765c985197c04112710"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v2.5.0-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "82f626d21aa2becb2491a8e3d1170be2c2ab68741bc6cb2619cc511d920c01d2"
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
