class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.4.1/statlite_0.4.1_darwin_arm64.tar.gz"
      sha256 "9e7668cdfec99d8e9f2fa1a5745049e55206d543b5fc44f09f0248ec4113b479"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.4.1/statlite_0.4.1_darwin_amd64.tar.gz"
      sha256 "6a29052e082501796129dade11af2a345d51d255156cd91e6e7aea5f1bd9b8da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.4.1/statlite_0.4.1_linux_arm64.tar.gz"
      sha256 "d891d28495320780f52708154e4ab17b67e00ef71a98cf4ed947bb0d7021d2cd"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.4.1/statlite_0.4.1_linux_amd64.tar.gz"
      sha256 "0c6a84c508750b163b037819584cd2fa1f48e6e87bf5b3a894c55fb063313ef7"
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
