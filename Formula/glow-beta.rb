class GlowBeta < Formula
  desc "CLI for the Glow platform (beta) — manage instances, deployments, and resources"
  homepage "https://github.com/learnloopllc/glow-cli"
  version "2.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/glow-cli/releases/download/v2.11.0-beta/glow-aarch64-apple-darwin.tar.gz"
      sha256 "7dd0d0f407b0b76b759b2e92d2d2c5d262b4684e39b5b9b9d8e817f24b3c992a"
    else
      url "https://github.com/learnloopllc/glow-cli/releases/download/v2.11.0-beta/glow-x86_64-apple-darwin.tar.gz"
      sha256 "84ae53f860922e43bf9f3047c32590f8b631796b48d2e2a3cf1d006d41f485b6"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/glow-cli/releases/download/v2.11.0-beta/glow-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7aaa8ba651aecfb950fcdfeb59ee3e7d9c05077acb36b6b3c6dccc8d25e0ec5c"
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
