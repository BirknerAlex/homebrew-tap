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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.4.0/silo-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "ddaf14284725708c3168f467ab957f4469a47f7bacd7531022ae91dd23759990"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.4.0/silo-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "9cb19203a8a21f670f1509557d83b3ede082408ad484d1edc31fcca9acbbe979"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.4.0/silo-v0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5015e764a71e12884dd4feee862d1b20d22f0b9aceef1dcd9a5565d9a74ac5b1"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.4.0/silo-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9e70d483eed8e627940e94bb7fe8f3c7f832d8d6a735c29dedba5c4ba49b360c"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
