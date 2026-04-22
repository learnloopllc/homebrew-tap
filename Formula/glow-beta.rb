class GlowBeta < Formula
  desc "CLI for the Glow platform (beta) — manage instances, deployments, and resources"
  homepage "https://github.com/learnloopllc/glow-cli"
  version "2.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/glow-cli/releases/download/v2.11.1-beta/glow-aarch64-apple-darwin.tar.gz"
      sha256 "b289b41b49d49ce896f8569987d4ab60c09a5c55dd546fd833eb0a742c61d5d1"
    else
      url "https://github.com/learnloopllc/glow-cli/releases/download/v2.11.1-beta/glow-x86_64-apple-darwin.tar.gz"
      sha256 "8e91552f16dfd40b23ce7a7ecced2fafed03a2aa256deabfd0c58e6790f5f384"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/glow-cli/releases/download/v2.11.1-beta/glow-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "18997ba62d668dab5a3a9aae26bde5ff5743fc97b901cb58565d7c26aca354a6"
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
