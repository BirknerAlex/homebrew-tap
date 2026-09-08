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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.13.3/silo-v0.13.3-aarch64-apple-darwin.tar.gz"
      sha256 "a00060c591b969ffd1b84283821a675b2f454c8e698fbcaff2c1e46543074edc"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.13.3/silo-v0.13.3-x86_64-apple-darwin.tar.gz"
      sha256 "885d2ca79f498df6f1112771475547a363e2a6ab2b499906246e5cedb4e95f50"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.13.3/silo-v0.13.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0f70a7e3f216b392b899de036f76f30a8fa87cb7863cb570256d40c82a5143eb"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.13.3/silo-v0.13.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "78ba280e46ff03f0575de4ecbaa9b4433ef0e795037432410a73240b272b1e12"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
