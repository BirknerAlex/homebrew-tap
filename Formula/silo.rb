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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.5.0/silo-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "7ce0857ce10281a0ca4038e93fffc0291099d902285dfeb30fa998c9f4562921"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.5.0/silo-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "5fd124ca4a8f8c54d4f0d9f2952e6e6b0b7fac42546c5a0a49edb5c60b829a7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.5.0/silo-v0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a22cc919d4d2294bca9b2afc8b6b419af72206c8186356b7218ff8b27c51b24c"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.5.0/silo-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "87ea86a151b091eff872ae2967db04f3d930109c978fa0a97f47b45e5281c06c"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
