class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.4.2/statlite_0.4.2_darwin_arm64.tar.gz"
      sha256 "0f20bdd9792387292dee6187eae0337ca2a7592df7a8520b0d4a5f4bdb0f4bb3"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.4.2/statlite_0.4.2_darwin_amd64.tar.gz"
      sha256 "8e8d027371890463b49c584f8cf9b065052982ad9a2283d5ba1536a6033db213"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.4.2/statlite_0.4.2_linux_arm64.tar.gz"
      sha256 "9251648354e419cb6fdc2703f4ebb3098c895f2156ff24605d3fd69c713bc383"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.4.2/statlite_0.4.2_linux_amd64.tar.gz"
      sha256 "3ac46337514783c89e0e0d2937146ef8e9bfa88c357a4e5e3c57e588e7fd7629"
    end
  end

  def install
    bin.install "statlite"
  end

  test do
    output = shell_output("#{bin}/statlite --version")
    assert_match "statlite v#{version}", output
  end
end
