class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "3.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v3.3.0-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "a327f420e27660fe8d3cbc1109926f38ef073a5813f5bd88a7e9ca0caa4c3cc4"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v3.3.0-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "19d0b0794db504419dc1a2819bb59ad4419467e43db01127f66cc68489cf572f"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v3.3.0-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2b2c1d8233647e68476e1776b4bb5f4e6dd85682cbd87166da4a18a7d77572e6"
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
