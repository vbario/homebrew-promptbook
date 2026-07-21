cask "promptbook" do
  version "0.1.7"
  sha256 "6fa53117c85b3c4f14c4bd807ba225deca65cd730e2a62ae2a218f1f3bf2151a"

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
