class Badger < Formula
  desc "Local context bridge for bringing codebase context to an AI chat"
  homepage "https://github.com/PVRLabs/aibadger"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_darwin_arm64.tar.gz"
      sha256 "48677a6f373a57924f1abc8543c13cdb99f04dc25457efefedc1b7653c23f02e"
    end

    on_intel do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_darwin_amd64.tar.gz"
      sha256 "0abb82c675c635c7a4013098788324f5bf1e967d205ebe98be4c6f25321a5681"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_linux_arm64.tar.gz"
      sha256 "14b885210db32c709f67fffd447fff58a57b08afa60ec1906af959f701d2518a"
    end

    on_intel do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_linux_amd64.tar.gz"
      sha256 "a67adb0a280101a211082cad50df58361aa319f31747a579fb8f435933f93010"
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
