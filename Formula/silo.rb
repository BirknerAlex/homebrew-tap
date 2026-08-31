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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.7.1/silo-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "04c7584ac9847bd4e8b4744476fa7744908f154ec2bcf895af6ca39b1baefae9"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.7.1/silo-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "a1f049a2bcf243ef0f2f5568288af9af261467450fde10b3dbf65c2b3937503a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.7.1/silo-v0.7.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5f8ea31e9f156d7df027f421ce6b84f678b0e6041d0d5f24038deb212df913da"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.7.1/silo-v0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f90ef0a8e380679331cf21d7ead69e66f5c13b9900b3cdd268302e67cc984808"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
