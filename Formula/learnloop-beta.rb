class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "2.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v2.4.0-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "902bf54b58b91a9062e0e3165747c18ee42f8da9d683a57e3b85ee10b76a1b46"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v2.4.0-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "f89336725ec92353a19a2aa1b4751bb77df22543d8d89fce1c4b7b2af78c1135"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v2.4.0-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "997877ea5c4fdac58d71cd4f0f6fedbc240d7db15626e5702a262ba85d966557"
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
