class GlowBeta < Formula
  desc "CLI for the Glow platform (beta) — manage instances, deployments, and resources"
  homepage "https://github.com/learnloopllc/glow-cli"
  version "2.9.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/glow-cli/releases/download/v2.9.3-beta/glow-aarch64-apple-darwin.tar.gz"
      sha256 "44b13e8f7194f6eeafa9e88110b0f7aa328a17eb14226f4a3b6e48b7e68da504"
    else
      url "https://github.com/learnloopllc/glow-cli/releases/download/v2.9.3-beta/glow-x86_64-apple-darwin.tar.gz"
      sha256 "fccbe546afb0da5e921e02a046aa6329950519f848e86446c3b719cd7ccfa18e"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/glow-cli/releases/download/v2.9.3-beta/glow-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5d48a759796c7e4d9bc6f2ddddc6e0f70266220add21028e7e4d518e478218bf"
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
