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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.11.0/silo-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "aae65811985a84b482a9e65e16a6ec44cc74cf75a687366499b7cde5bcda7c74"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.11.0/silo-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "66491d459ebd74d8779f66790704d5370f2146fc6009608e61a6d8a0c3184f79"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.11.0/silo-v0.11.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bd2176afcc1ff8288b665b046025e8c40b63b1d5d5689faea7c5b9ce0b114106"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.11.0/silo-v0.11.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9bc4c85125c4411249edefb0b85a59a4fa98f86040372bcc9c00b0268269fbbc"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
