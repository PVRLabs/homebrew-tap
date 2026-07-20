class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_darwin_arm64.tar.gz"
      sha256 "fa7ba9725e0d98d7fb841ea297b5397e440cdbd52877f1e881bdef0b97ba6c97"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_darwin_amd64.tar.gz"
      sha256 "97e1dc1b411551469ebfe3c79a2571be670b2b0867f81f474ebebf736c81f0fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_linux_arm64.tar.gz"
      sha256 "026337295d7b578c8b78bfedb5c5319d453a6077303e5bbd4cae25729998323a"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_linux_amd64.tar.gz"
      sha256 "98d50a8124081ea8f0cdc1f74ff4407322239695d5b3e030f8637cadc778e015"
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
