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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.10.0/silo-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "41bb00cfade4c8adcaffcb9bd70f261894a586b391270252521e2714bcc247b0"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.10.0/silo-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "e0c4016cf3dd877d9580e6cd342ee41a2913c8687d693e7f4bf406c8f5f5a2c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.10.0/silo-v0.10.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fc982ed74b5cc09e826ea35e4f2f6c15745e43fbfd0c950db179c3c4ca8cb870"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.10.0/silo-v0.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "95af4e2d86bf6cb149d1e46186f143a815989833e7f2acdbdbbc20b9ace76e53"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
