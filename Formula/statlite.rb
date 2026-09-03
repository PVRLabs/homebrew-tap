class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.4.0/statlite_0.4.0_darwin_arm64.tar.gz"
      sha256 "cd037e62e9bf254ac7e4ea4b4053140d52f2b547b171c6387eb6fb986475a52a"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.4.0/statlite_0.4.0_darwin_amd64.tar.gz"
      sha256 "b8aae3bedd8876cad4874e9868cbddc001dcba31785c1fa419113a399677fa7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.4.0/statlite_0.4.0_linux_arm64.tar.gz"
      sha256 "2177fd8ec95402f99c28c4505d3f9dde5554bad7257a1743b3d462a2221f85ee"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.4.0/statlite_0.4.0_linux_amd64.tar.gz"
      sha256 "1b53d21af92a9f7a338873b67125ac9d59b7df09a0614125540d317e4a88b632"
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
