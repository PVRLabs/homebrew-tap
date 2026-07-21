class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_darwin_arm64.tar.gz"
      sha256 "8f81b19a4f8c5cb07bcbaad5f22a0345637f4888958998083604d2cc6a79b250"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_darwin_amd64.tar.gz"
      sha256 "a7bc10d96650053f0c0d9ae1f25eb429307d281f26371e96ce15505d1501c0f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_linux_arm64.tar.gz"
      sha256 "40a1c7ad77ba4edb653a10f1153971f89023703710b954ff24caa5df608d5a5a"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_linux_amd64.tar.gz"
      sha256 "68e36ddb858129ff0af5a78a5ba6ed944c04b1cf3652a9a3e7579113cc313d34"
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
