class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v2.0.0-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "d7cd8e038eb5953c851076391fb412afb5af6a15b8d001d9524df28db7a4770d"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v2.0.0-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "d5777514f2f4ad15cde77cc927c5615d2756dd309b63fdbd120a9aa57cd62e77"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v2.0.0-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dae826085d5e7669de8bd1ed3e78ec3e5469d7bd507785483f75e1fe99c121bc"
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
