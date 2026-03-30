class GlowBeta < Formula
  desc "CLI for the Glow platform (beta) — manage instances, deployments, and resources"
  homepage "https://github.com/learnloopllc/glow-cli"
  version "2.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/glow-cli/releases/download/v2.10.0-beta/glow-aarch64-apple-darwin.tar.gz"
      sha256 "b9597692be00075828270ea446624593a3bca0344f3f6e5f55caf614a0f3872b"
    else
      url "https://github.com/learnloopllc/glow-cli/releases/download/v2.10.0-beta/glow-x86_64-apple-darwin.tar.gz"
      sha256 "9ab78c0c0bf210f06e241415854b01f77e8414db41b31c93df3f80635efc8c35"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/glow-cli/releases/download/v2.10.0-beta/glow-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "afd5ea47ef84f8a71e6423f67a4a4bb7ca77a8134864ab9f81d589278ce38379"
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
