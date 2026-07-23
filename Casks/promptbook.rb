cask "promptbook" do
  version "0.1.9"
  sha256 "2ea7ff07acbb23071044523a9c81f64da3e61547424c0d3724ae211c1be82214"

  url "https://github.com/vbario/promptbook-releases/releases/download/v#{version}/Promptbook-#{version}.dmg"
  name "PromptBook"
  desc "Terminal with a dockable, runnable notebook"
  homepage "https://web-production-09445.up.railway.app/"

  # Follow the artifacts repo's latest release rather than parsing the URL, so
  # `brew livecheck` keeps working if the asset is ever renamed.
  livecheck do
    url :url
    strategy :github_latest
  end

  # The app and the disk image are both Developer ID-signed and notarized, so
  # Gatekeeper accepts them on first launch and no caveat is needed.
  app "Promptbook.app"

  zap trash: [
    "~/Library/Application Support/Promptbook",
    "~/Library/Preferences/app.promptbook.terminal.plist",
    "~/Library/Saved Application State/app.promptbook.terminal.savedState",
  ]
end
