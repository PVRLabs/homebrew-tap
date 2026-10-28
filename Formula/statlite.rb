class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.7.1/statlite_0.7.1_darwin_arm64.tar.gz"
      sha256 "05605cea18a8f88b277d359525ff7b26d033fa4fb49c29ccb63e36131232966a"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.7.1/statlite_0.7.1_darwin_amd64.tar.gz"
      sha256 "c1f024a0e69c0efb34ab7cb0c480665fb188014fdb18a3a84b1411a2fcf510eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.7.1/statlite_0.7.1_linux_arm64.tar.gz"
      sha256 "15447c14061c9edb13e40b56ae71699b271ca860a8878d13764161c0e4801d25"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.7.1/statlite_0.7.1_linux_amd64.tar.gz"
      sha256 "d54b2a388efd099d5959abb4cb24bffb05098d9a657551d77c4cdf9de7848a93"
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
