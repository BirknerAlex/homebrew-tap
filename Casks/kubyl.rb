cask "kubyl" do
  version "0.3.9"
  sha256 "088eeb581f04de5a0c5450c6390999187021e6e950589eba4aa1669115094499"

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
