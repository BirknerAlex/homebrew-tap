cask "kubyl" do
  version "0.3.8"
  sha256 "c7cebc0f18ca82286a8002a35389ef360a05452efff4e538f1f393ec80610fe7"

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
