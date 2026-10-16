class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.6.1/statlite_0.6.1_darwin_arm64.tar.gz"
      sha256 "7c994fdd5c093c69e7595a49607190130316c568799df3b4a8e4db676f37f82e"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.6.1/statlite_0.6.1_darwin_amd64.tar.gz"
      sha256 "0ff0cc0b91e01326d68a90bc07736b1be6fc4541000bed4b5819ec4e19d4e646"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.6.1/statlite_0.6.1_linux_arm64.tar.gz"
      sha256 "b6f16e9e913c10b6d1835ec76a0aa309baeba13215e222952942f3844be559f4"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.6.1/statlite_0.6.1_linux_amd64.tar.gz"
      sha256 "beac5dfa050938d5b7f52a66f85cfafe722f7ad230b192b0bf975e4425223ec9"
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
