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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.12.1/silo-v0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "254034838f1a96b622d8c4524b4a6d29619b8857eadda3075c11566cd543aad9"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.12.1/silo-v0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "f8d9f29060c31a4195d289393adca474d96932dd623493283e738bc925676db7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.12.1/silo-v0.12.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3b23d709d79ed94628d96ee0934562d6012738303aca4f7e0ebf759cff1bc5a4"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.12.1/silo-v0.12.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d5d41589f6a8b771e665b594abecc45f299286eb8ea7b07ee728dfcb103da9d7"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
