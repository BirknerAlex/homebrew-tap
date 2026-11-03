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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.16.0/silo-v0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "b0e9ae4f27369d3621ca4f44bc1f1376158bdc8a381c06f4673555ed647393c9"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.16.0/silo-v0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "e19a07b6cff620a3f42e7a53034a626a41b8169e8d3f1769f94c60e7abc70d55"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.16.0/silo-v0.16.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "48df24fcee68c38a79a4c5c58b619ef2a669c5650c546f08c1acbab8ef154cb5"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.16.0/silo-v0.16.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9671dd3831ff743d6d0d396c338b75caf7c7c2cf69acb8d72ab349e0d44bb455"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
