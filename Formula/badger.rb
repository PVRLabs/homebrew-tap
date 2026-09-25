class Badger < Formula
  desc "Local context bridge for bringing codebase context to an AI chat"
  homepage "https://github.com/PVRLabs/aibadger"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_darwin_arm64.tar.gz"
      sha256 "60f8ea9d9a2c599401e5c37c2b0197dda7f286cb09dfb9741e2bd4c2022b1a18"
    end

    on_intel do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_darwin_amd64.tar.gz"
      sha256 "935627415174c69b9d8adc13e99147d8f20af6fa621a4e588bb7c5a1bba85614"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_linux_arm64.tar.gz"
      sha256 "46d7f7b00d681750ea5dae564cf66b5707b1a30469dfe824ba541d15f45e54f3"
    end

    on_intel do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_linux_amd64.tar.gz"
      sha256 "8177e622d797dbfd5da472a9e594128b74c1f195c761ab1e80eeab0aca6754e6"
    end
  end

  def install
    bin.install "badger"
  end

  test do
    output = shell_output("#{bin}/badger --version")
    assert_match "badger v#{version}", output
  end
end
