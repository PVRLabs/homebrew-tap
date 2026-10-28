class Badger < Formula
  desc "Local context bridge for bringing codebase context to an AI chat"
  homepage "https://github.com/PVRLabs/aibadger"
  version "0.8.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_darwin_arm64.tar.gz"
      sha256 "1808a2fb4d103ca3e13980803ee6830174cdae7711aa3d98624fa14881c9d8ec"
    end

    on_intel do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_darwin_amd64.tar.gz"
      sha256 "8a8702f09bc9ef91dcd06f32d63993c961a58c9e90edbf1b76bf536a1d21f183"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_linux_arm64.tar.gz"
      sha256 "0caf26bb3a28854ad4ea14e995905dd0c46bac429cf6e1de70aad5358eb269a0"
    end

    on_intel do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_linux_amd64.tar.gz"
      sha256 "2630f00477698056c8e811c491f4a44ac16ab1f51c6eeaf97f24ea20211b21a1"
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
