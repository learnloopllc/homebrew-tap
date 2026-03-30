class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "2.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v2.3.0-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "d6f789ca5ac7f9d631b8eb371804ed4dcd845296ab395d5d80564bc6103123d5"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v2.3.0-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "bce96afd2ffad38ed4c840e9dd5a2c862e40c5baab5526117cf889df02eb0f83"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v2.3.0-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "32c7594070334de90046b6c7d3e1e6619cc2417d3f3bcdf2dd532318cab7f4c6"
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
