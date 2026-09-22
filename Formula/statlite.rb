class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.4.3/statlite_0.4.3_darwin_arm64.tar.gz"
      sha256 "a8da9e2ee752e12fd68579dbcc9f5bca373887e7e05b257d30a0820a9ac2e16d"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.4.3/statlite_0.4.3_darwin_amd64.tar.gz"
      sha256 "5a34a82fe4c320ad3eb44bafd8f7ce82382c52b2928c1b531071c321e86979d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.4.3/statlite_0.4.3_linux_arm64.tar.gz"
      sha256 "63cdbedd276268dedb06b4d786d6e5eb3c49edc9e1cc7c3e6cf1152332e7dd4d"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.4.3/statlite_0.4.3_linux_amd64.tar.gz"
      sha256 "76c22d87b0cf300ab6246f42ccf0d25e6ffe34fed12595e03f1a4d6d3c6057f4"
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
