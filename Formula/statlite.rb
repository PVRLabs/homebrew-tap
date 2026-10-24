class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.7.0/statlite_0.7.0_darwin_arm64.tar.gz"
      sha256 "92ab78123fba48d13b0dff9470997a4525ac0dc9167b1b7aac2509f7579a768d"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.7.0/statlite_0.7.0_darwin_amd64.tar.gz"
      sha256 "3524221a7b3a48663b549af21d1fa5dc63366e2b6b7908901a4563b2fbf794a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.7.0/statlite_0.7.0_linux_arm64.tar.gz"
      sha256 "15d73059f542888c28cc6cc86267483989994c44786283643f804024a14cfe3c"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.7.0/statlite_0.7.0_linux_amd64.tar.gz"
      sha256 "84dbd5cd153c23667ea1883679c80aff8473c0c2573ca0195bfdfe3e4465a05f"
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
