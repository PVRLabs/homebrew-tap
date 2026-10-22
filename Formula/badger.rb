class Badger < Formula
  desc "Local context bridge for bringing codebase context to an AI chat"
  homepage "https://github.com/PVRLabs/aibadger"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_darwin_arm64.tar.gz"
      sha256 "04865b2fb42ba2f31047578ca343a930e3fa70f73b58980cc12513529c64835d"
    end

    on_intel do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_darwin_amd64.tar.gz"
      sha256 "91c90848aa3ff80086f7a32cf1b1c0dafb7a487417fd4f6f1f361317f7b7ea1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_linux_arm64.tar.gz"
      sha256 "22a1b786a965b47ee9dd66df5763e21f77afbd60235bc37658e005c79669660f"
    end

    on_intel do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_linux_amd64.tar.gz"
      sha256 "600eb068f4e3b3421de3fce20024cda225555a8543170c7cc54ecf38d82d3557"
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
