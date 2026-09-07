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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.13.0/silo-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "3bddcb0016facddaf217ab9225922165e50761623bfc60e6eddc2b03528c84ce"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.13.0/silo-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "8dcd1ca705043b429be6017666c1f251be570f7f251ec21575d406ecc7fa8a0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.13.0/silo-v0.13.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7e66cf808bfaafef4d98b917d2b6fda2bd10e76b019bf7061ad884a818e2ef56"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.13.0/silo-v0.13.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "db58b3ea0c95ce982549a3d1252dd1839eac0f32e61fd047e36a29771582ba4f"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
