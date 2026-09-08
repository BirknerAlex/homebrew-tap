class Silo < Formula
  desc "Self-hosted package registry for RPM, Alpine APK, and npm"
  homepage "https://github.com/BirknerAlex/silo"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.13.4/silo-v0.13.4-aarch64-apple-darwin.tar.gz"
      sha256 "07106020e48d20fc8d4ae0c481d37b8c2862832bc1a515c13a7f46d81d551f81"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.13.4/silo-v0.13.4-x86_64-apple-darwin.tar.gz"
      sha256 "ecdf1f04e61c491c32f220376e698da1a30b5dfa85ed658ef6f3a0c8e6e21033"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.13.4/silo-v0.13.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f817ca5299da247f3e65705b18e8d5e5499f2e816eb02f2f5a2de88e00c6b6a5"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.13.4/silo-v0.13.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "41ab5e94a64ffdae8742a749ed1f849b5bfe9c35de4d61c3f9a3849b008ea049"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
