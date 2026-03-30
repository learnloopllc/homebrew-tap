class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v2.1.0-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "b048f7d1f81108651916e5cbb14bbde2815ba96722ef93ce20c75e421522f7b1"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v2.1.0-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "0f79708a2dbbaa6b9fb799286825b632d880b3bd68b693b2b0d43dfb6b025ada"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v2.1.0-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "944579ad1458ac5030ea53a664716fa431caf5b0df1443aff166c60dc2abbb01"
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
