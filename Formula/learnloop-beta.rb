class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "3.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v3.2.0-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "41ebd1f1d6c57fc623bbc207715c361fa6292b3c679887d76f3dea78491404d5"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v3.2.0-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "26365575804f3bb69424753f8ffa7781ea8726d51119ac8303b589547714cb09"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v3.2.0-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "49acb4f2ec1c6339376f00f0b2b57e60725a445df9d9d45d401cca1ba019639e"
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
