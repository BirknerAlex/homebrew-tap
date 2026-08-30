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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.7.0/silo-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "d3a0208fb5d9d2215da4e7d378aba12c323d0035635c9ec7dbc1b2fd724d03c9"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.7.0/silo-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "01e17c841b2db92b4b340c0fae28ed6b9de17907cb0dc2f523c839a07167d558"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.7.0/silo-v0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "563564ef39917cae8cd8b5f14dc108e618f66af5553674f2bca229bb3a84299d"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.7.0/silo-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bbf33154dee7e101d0548fcde93e09a2ce8480425c250ca84cd20a66268fe50c"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
