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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.4.2/silo-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "67bfb8becd9b8f6af9d32df99cb33c53be95ccbe2129066b9bbb3c5f03d6e523"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.4.2/silo-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "bd7ef0ac856c5cae2fada6a361dc0cb3c46d7d608a8149cb9ddcbc308e6e7894"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.4.2/silo-v0.4.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d35be1279cf15052a140c54b0dff108b0d05ecff9032c2be9d4c8fac24701a9e"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.4.2/silo-v0.4.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cb749f4f832b660ccdcaca9bdbf40bddf3b9a668fe18023d0c8c801134fc0140"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
