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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.5.3/silo-v0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "489f36e348fa072967b9403fac2b4f6ee5b485e51bee7d6563429091c0a8b2e6"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.5.3/silo-v0.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "4552682412a8bea5ada375ee34b18560e9a08cdc8ec9e14857c969ef86e2123d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.5.3/silo-v0.5.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7b15d375bd864dca4c02e320171034c65d41206d1a99bd49b21b0e3c30d5163c"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.5.3/silo-v0.5.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "77a7e78e3b718d067207bc5e18ced64531acd46ab96cc80260e59817891710d9"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
