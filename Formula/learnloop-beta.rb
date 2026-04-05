class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "3.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v3.0.0-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "6b53ca64fbf9ba8d4348d356eb2f2ea1b2fd2accb0e62e1b6c6d098a4156864e"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v3.0.0-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "74ff2ed06e54a06d1971a3b88d868d430ac4e64f4c5d974fd9fbccaa96a8c7bd"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v3.0.0-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "97e1ebf2fee3fe4f8426f18ac0aa70620e5db6eeaa31b66c8c6c1f89a0910d16"
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
