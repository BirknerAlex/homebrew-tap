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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.13.2/silo-v0.13.2-aarch64-apple-darwin.tar.gz"
      sha256 "ab614fd6cfbd6168d45189ec9ca2fdeebb751246286fe8d792a1687defd51c1a"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.13.2/silo-v0.13.2-x86_64-apple-darwin.tar.gz"
      sha256 "46519a47231f730002c3765c2ab18a9059f7ba26396c83d22928f6e88e1a3151"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.13.2/silo-v0.13.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "128caf76b7578ad25e4daa20015299eaed7617acc25cffa1f93201053af4052f"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.13.2/silo-v0.13.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f6e32a8cf2812fd5557eb5ff1180ba6881101a2cfd3cdc14f64e332615d9ab7d"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
