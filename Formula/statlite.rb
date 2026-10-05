class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.6.0/statlite_0.6.0_darwin_arm64.tar.gz"
      sha256 "c43f33059df1aefed49493f7db03fe59f8f72479a3b5b6560d9ddaa79b73afef"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.6.0/statlite_0.6.0_darwin_amd64.tar.gz"
      sha256 "995c5c3fa9d38290f31fc2e7a9fcb8a351ea4070d1d2cfd655313e3615e6b55f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.6.0/statlite_0.6.0_linux_arm64.tar.gz"
      sha256 "0beba77e32cdb66a64088ecc97ea174549f292034b50230a3c71db3dca5d1017"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.6.0/statlite_0.6.0_linux_amd64.tar.gz"
      sha256 "e874d83d8f3828ad9dcfdc2020541da6f829148faa30fb5173f866468abb3292"
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
