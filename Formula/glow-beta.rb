class GlowBeta < Formula
  desc "CLI for the Glow platform (beta) — manage instances, deployments, and resources"
  homepage "https://github.com/learnloopllc/glow-cli"
  version "2.9.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/glow-cli/releases/download/v2.9.2-beta/glow-aarch64-apple-darwin.tar.gz"
      sha256 "3bc65d2b713ea27d5569135a2aafb0ec933b8129ac6b2207f1f36b1b4a18c54e"
    else
      url "https://github.com/learnloopllc/glow-cli/releases/download/v2.9.2-beta/glow-x86_64-apple-darwin.tar.gz"
      sha256 "2f25238ee2892d46afa6fde914b5cac2407b31a5ca090eefe2aca637012f3514"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/glow-cli/releases/download/v2.9.2-beta/glow-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fd7b68d7ae13e768278b4a9e7713bf6b1e3cd1e745f771bf2a6fe21994184b13"
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
