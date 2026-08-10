class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_darwin_arm64.tar.gz"
      sha256 "e4cf35447dfffd3bc23d7b98c9f2dced1c738b1da6db98d25099ccb2f71c2467"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_darwin_amd64.tar.gz"
      sha256 "c5e2b14b2dc04d88f883554495e9530557130eb828923b968fe8a13798ee384e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_linux_arm64.tar.gz"
      sha256 "e62227a023c152ba82772a899db4340dd3756b454d4bc6091d65c8b89dfe8081"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_linux_amd64.tar.gz"
      sha256 "d3e9cc7f92e59dfa715146dc49d0f5449134959d37170214e22e30d39cc40efb"
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
