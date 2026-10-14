cask "kubyl" do
  version "0.8.0"
  sha256 "5f67b016c38302887eb458d7918e0e4cff70f9a1c8759eecdcc3950560e8c90b"

  url "https://github.com/BirknerAlex/kubyl/releases/download/v#{version}/kubyl-#{version}-macos-universal.dmg"
  name "Kubyl"
  desc "Native Kubernetes desktop client"
  homepage "https://github.com/BirknerAlex/kubyl"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Kubyl.app"

  zap trash: [
    "~/Library/Application Support/Kubyl",
    "~/Library/Preferences/io.github.birkneralex.Kubyl.plist",
    "~/Library/Saved Application State/io.github.birkneralex.Kubyl.savedState",
  ]
end
