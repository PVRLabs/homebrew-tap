class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.7.2/statlite_0.7.2_darwin_arm64.tar.gz"
      sha256 "0aeec6f4f1b754fb488c128894321398cbe1cf74a3660cde615f75a25198252a"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.7.2/statlite_0.7.2_darwin_amd64.tar.gz"
      sha256 "5395a43ff4c0faba05b5e5376e67319b021c8d7602c39254f2c2102a3842bdf9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.7.2/statlite_0.7.2_linux_arm64.tar.gz"
      sha256 "0209c66a5b802fb914efecfc7f95e46d21dc47c6379807fac13a85bfa39fc082"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.7.2/statlite_0.7.2_linux_amd64.tar.gz"
      sha256 "a426e562b39df9ce38b24e9f8e24094eb9ec1560fa862142d9f766cd13ad50fe"
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
