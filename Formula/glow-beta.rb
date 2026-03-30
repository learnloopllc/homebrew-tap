class GlowBeta < Formula
  desc "CLI for the Glow platform (beta) — manage instances, deployments, and resources"
  homepage "https://github.com/learnloopllc/glow-cli"
  version "2.9.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/glow-cli/releases/download/v2.9.4-beta/glow-aarch64-apple-darwin.tar.gz"
      sha256 "51b1977c9d481d6a47f0a40fde295cb94f46763aa6c23965a78c28f3449a9b88"
    else
      url "https://github.com/learnloopllc/glow-cli/releases/download/v2.9.4-beta/glow-x86_64-apple-darwin.tar.gz"
      sha256 "ebfa5fef4e8fc08fccbc25c15ec04bab9825259abc453d4eb9290c8f9059c2b2"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/glow-cli/releases/download/v2.9.4-beta/glow-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "70a5041b5abc9db175f277f3581bbd04f0116d1639dae1b0b18cacd7a5145880"
  end

  def install
    bin.install "glow-beta"
    bin.install "glw-beta"

    generate_completions_from_executable(bin/"glow-beta", "completions")
  end

  test do
    assert_match "Glow CLI", shell_output("#{bin}/glow-beta --help")
    assert_match version.to_s, shell_output("#{bin}/glow-beta --version")
    assert_match "Glow CLI", shell_output("#{bin}/glw-beta --help")
  end
end
