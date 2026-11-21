class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.7.3/statlite_0.7.3_darwin_arm64.tar.gz"
      sha256 "62aa7d6811096448613b48834386409a0eb2451be433e93c33b15c3788de0842"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.7.3/statlite_0.7.3_darwin_amd64.tar.gz"
      sha256 "d3b97445c545ed82ec0c5c46dcd3e58a4bc56780a4273fc536995a067a986f16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.7.3/statlite_0.7.3_linux_arm64.tar.gz"
      sha256 "5434bda122a16e0c2d0208d0d22a9b0f5019e79718bf299997400a398dd0e909"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.7.3/statlite_0.7.3_linux_amd64.tar.gz"
      sha256 "386bd7616cc5f3d505d41be016f429a27b4d1237352275dd209f39af590c4c9f"
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
