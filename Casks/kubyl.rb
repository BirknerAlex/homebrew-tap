cask "kubyl" do
  version "0.4.0"
  sha256 "0e6810241ea5a8d7a3aaea67639034a2fac293078a24b03d83484051d79fd899"

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
