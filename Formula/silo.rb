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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.14.0/silo-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "62e3a0d12f31ec8bc3ccdbfd039d599b4b4be561be119ace378dd99fd07d15ac"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.14.0/silo-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "31477e5b7ce8a59771e031fa4af212dbc4c09c7028ac445f4d2f47876049b272"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.14.0/silo-v0.14.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "187f9a3bf238645fabf3346dc4e0084b21cabfe47681603d936831909fd5c7e1"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.14.0/silo-v0.14.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "782de51bc7cf340649b277c59567b60baa057f0a589b19412045dc07358de4a9"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
