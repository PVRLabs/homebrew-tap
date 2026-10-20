cask "leanbar" do
  version "0.1.0"
  sha256 "fa0e1962638ef8ed60d61cd5ea83013b3458de65978389c6f94bf6ba51189890"

  url "https://github.com/PVRLabs/leanbar/releases/download/v#{version}/LeanBar-#{version}-universal.zip"
  name "LeanBar"
  desc "Lightweight native menu-bar host for scripts"
  homepage "https://github.com/PVRLabs/leanbar"

  depends_on formula: "python"
  depends_on macos: ">= :ventura"

  app "LeanBar.app"

  caveats <<~EOS
    LeanBar is ad-hoc signed and is not notarized by Apple.
    If macOS blocks launch, allow LeanBar in System Settings > Privacy & Security.

    Launch with an absolute executable menu script path, for example:
      open "#{appdir}/LeanBar.app" --args "#{appdir}/LeanBar.app/Contents/Resources/menu.sh"
    Opening the app without a script does not configure a menu.
  EOS
end
