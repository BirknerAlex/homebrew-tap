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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.17.0/silo-v0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "9676d36fe3a4ca8aab394e72c9e41634fac8a149aefb0fd59cdfb11914719971"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.17.0/silo-v0.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "d7c309070e86bea66ce7961e67bb5568c806e07e500b5fd7c67957d3b77db398"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.17.0/silo-v0.17.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c046a623670b8a1f5311b86a9b4a3a3d01f5c171c3b479e10de6786353649993"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.17.0/silo-v0.17.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f79255da3d0678f6a4a6f0931c1d88ba33af488ab4c41a07f1a3f6df9365c1bd"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
