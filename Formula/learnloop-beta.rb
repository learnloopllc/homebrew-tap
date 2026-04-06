class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "3.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v3.1.0-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "7a5d6d0c867a69142048cdce0b6c10a501395947f58fe79cc462766a0ef98dad"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v3.1.0-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "cb63aa783215a100c5bbf202896656e486193cafa9c8f696e2884aeefd35b2a8"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v3.1.0-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8116681c2f5835e43de0d38e3a353ebea95aef59b73dbfcfb850e608f8fcce14"
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
