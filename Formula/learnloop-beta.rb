class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "2.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v2.7.0-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "489016868c4eff5a1c587d9a18a8a68f55ed10b891a01dcc82a15fa4fdfda7cf"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v2.7.0-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "8e2f20ad055ca83a2afd0d080e33b2c9cb79f0727a14e2c5ee4aaa684b701617"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v2.7.0-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7fb2b67ef738f1cfd2b2db5b40aee0d014946d7976c7819e74a5f9fdcd49b8a3"
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
