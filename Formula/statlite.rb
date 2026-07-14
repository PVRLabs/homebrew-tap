class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_darwin_arm64.tar.gz"
      sha256 "92941fc72c5549a04ee9f3d4c806351c95765b5df721ff6cf90aae2df6cc2766"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_darwin_amd64.tar.gz"
      sha256 "c7b390e48e4b0eed14ebc92f867d6e2f1d06304068895ca214cd066eebae1d71"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_linux_arm64.tar.gz"
      sha256 "ea1900a2f4143feaa8ee4b6fbebb548c6eb616ebfe3954de9e7db99a7081a1b7"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_linux_amd64.tar.gz"
      sha256 "58d8f73bdde297f0565777396e60c6c5c1c26c34bc2c4c4881e89f0822446852"
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
