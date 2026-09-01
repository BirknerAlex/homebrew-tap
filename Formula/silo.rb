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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.9.0/silo-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "eb9ab9b1909398e59d36c69a8ed8857b6c3b7e49ee51984559ca7a1eab516a71"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.9.0/silo-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "735eab219188df59e8d7bf4c611141d935eb2ec3421a542cec9ae5ad42f45888"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.9.0/silo-v0.9.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "df5000a9b7bae44ae7ca627a9681d3261ef689bcba6f01b149c47b36a800028c"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.9.0/silo-v0.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "853dad5373accb1680a0527b79d5e23b86eb63bf46c256f6d7dd0dd9d5a70809"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
