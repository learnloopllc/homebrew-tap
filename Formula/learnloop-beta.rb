class LearnloopBeta < Formula
  desc "CLI for the LearnLoop platform (beta) — manage orgs, billing, deployments, and licenses"
  homepage "https://github.com/learnloopllc/cli"
  version "3.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/learnloopllc/cli/releases/download/v3.4.1-beta/learnloop-aarch64-apple-darwin.tar.gz"
      sha256 "2aca045ac2caeb32d3be08293eae1c9b4a84887ac98a418dc18c00c2a74fbb3a"
    else
      url "https://github.com/learnloopllc/cli/releases/download/v3.4.1-beta/learnloop-x86_64-apple-darwin.tar.gz"
      sha256 "c6d21ad00201c2a97eef00fe6d529ac313c4c3209e35ab2dba7c8256585dc17d"
    end
  end

  on_linux do
    url "https://github.com/learnloopllc/cli/releases/download/v3.4.1-beta/learnloop-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5240431cdd21000b30cfe6549aa8838c75e4e5566891be1b67f9ad4243fece8f"
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
