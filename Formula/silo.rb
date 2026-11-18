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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.18.0/silo-v0.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "05502aacb96d0c08e1531ee9ffd995c417896a4653bc79eedae0dd5dfa95d65c"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.18.0/silo-v0.18.0-x86_64-apple-darwin.tar.gz"
      sha256 "8f43fef11d66b270209397430fab844008ed89bfa317c65713e74fc94ee0b261"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.18.0/silo-v0.18.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ae4d447729693e14aebea356ccc3c1f4f2ffbe22c40779416f808f41ed11426c"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.18.0/silo-v0.18.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "51148be4fb9bae75e450ac6593564496236aac5821ffc43ed9db21214ccaf287"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
