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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.15.0/silo-v0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "86ee2f1f52a4c13042915d89275f84a54c006174da814398c4f129aba3466463"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.15.0/silo-v0.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "7a08c5dfe3592a03c2cd253625d505f7bc940f3bfbf1c94e2bef92f84c6560c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.15.0/silo-v0.15.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e70f3cf83962cf01919870df75299bd1ebb81689951cbc0bd054352eac60dcc1"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.15.0/silo-v0.15.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "66379a3e178229fea3735349dd10b18d09947c9511e257faadc9e8e49cacdace"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
