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
      url "https://github.com/BirknerAlex/silo/releases/download/v0.8.0/silo-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "a04f6a397a8d6ed6fd7a33cadfc762de39939bf5553b837faf629c3177b843c3"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.8.0/silo-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "9c76fbed90345ea7c42af464a7dfb571ddb1efe5474a477793b538305497640b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BirknerAlex/silo/releases/download/v0.8.0/silo-v0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8651cec0970a0d5932028d99d06718493a75916aa5b12b0a30eede6cd055a805"
    else
      url "https://github.com/BirknerAlex/silo/releases/download/v0.8.0/silo-v0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d983277cffe040797cc5df91e4d5e3b78fa090fb993c274bf394714e71ca9d0c"
    end
  end

  def install
    bin.install "silo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/silo --version")
  end
end
