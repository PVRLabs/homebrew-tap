class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.8.0/statlite_0.8.0_darwin_arm64.tar.gz"
      sha256 "6a837c3181abe963545bea11e1cc43cc17650968898e3537b76384ac29c59fe0"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.8.0/statlite_0.8.0_darwin_amd64.tar.gz"
      sha256 "167e205b63cf19a60b52c95114010d6d5ac9c74aba5bd3e317dc8ad53b3a1bbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.8.0/statlite_0.8.0_linux_arm64.tar.gz"
      sha256 "975e9422a80a2ca12093a0e1856a977364a195afd4f36bc0381e5761ca1dfa30"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.8.0/statlite_0.8.0_linux_amd64.tar.gz"
      sha256 "2f8c197865f3289b234b0c455ec504b88c38afce0b6de9473846d0a1e8dd03df"
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
