class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.2.2/statlite_0.2.2_darwin_arm64.tar.gz"
      sha256 "8f0a45902efc32fe954883e92e406ae30648bffd203409439391a6e0fe34d6be"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.2.2/statlite_0.2.2_darwin_amd64.tar.gz"
      sha256 "c94f7f127709f6dda8d0ce436204f4f1fa63a931095fd96bddeebe4442a86b27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.2.2/statlite_0.2.2_linux_arm64.tar.gz"
      sha256 "7c0d24955c824576470a4b5ebc7d1f86f7d7784db7803d8bf84db43f65a73598"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.2.2/statlite_0.2.2_linux_amd64.tar.gz"
      sha256 "ed33a57447b0f0dd8ca423917e00838c9ec7e0a2aaf744f92e544a7d0902d04b"
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
