cask "kubyl" do
  version "0.3.1"
  sha256 "38c5329f1d1fbbb0eb891ae7aefb8231251826aaf28b26b652fe373544c0e5bf"

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
