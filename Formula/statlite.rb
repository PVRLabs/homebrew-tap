class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.5.0/statlite_0.5.0_darwin_arm64.tar.gz"
      sha256 "7baaef2e6606dda80c32b71620c2cb868d633656e6435f0dbb13a1693415322d"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.5.0/statlite_0.5.0_darwin_amd64.tar.gz"
      sha256 "a44e7c07e81b0575f93a8dd884bf2091409c0bff1d0aca4bf11fe9e1dc504139"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.5.0/statlite_0.5.0_linux_arm64.tar.gz"
      sha256 "f5f5ccad32067b84199d7c094d7e7335d415ecf7ee3e244328c771cc6658f957"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.5.0/statlite_0.5.0_linux_amd64.tar.gz"
      sha256 "e1307df1d728035c4291ae7cfd03ade85a4985258f222d5b7806ebb149b954db"
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
