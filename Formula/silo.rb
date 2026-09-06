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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.12.0/silo-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "19b2ff7dd33b8a0fc4075540824bde97d86fc4d979c12bcce184e94946a668c9"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.12.0/silo-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "dfaec06539ce3b05c320a46ba5dbf81325a1571b07d2226ba1a9f0ed4cd39c19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.12.0/silo-v0.12.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8a97683193696f791f956c9b6b8a1af037328db46340e24a80e7ade7f64ab3dc"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.12.0/silo-v0.12.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3247a68e8ad185ae649779fe02ee014263f083df1c709543ebd368eb38eb19a6"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
