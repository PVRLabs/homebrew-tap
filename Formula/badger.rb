class Badger < Formula
  desc "Local context bridge for bringing codebase context to an AI chat"
  homepage "https://github.com/PVRLabs/aibadger"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_darwin_arm64.tar.gz"
      sha256 "54c6bacb64b78a7519474d4d186d14d8eecd6c4f9f3ecb6ceddafeca187a164"
    end

    on_intel do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_darwin_amd64.tar.gz"
      sha256 "217110d932e24e9566bf630b96852b98af0d17a714e25dd0a38ac1487eddae02"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_linux_arm64.tar.gz"
      sha256 "0cb9e05a35fd25351fb37c167918d8430cd3496e2d1a880a6072610310558910"
    end

    on_intel do
      url "https://github.com/PVRLabs/aibadger/releases/download/v#{version}/badger_#{version}_linux_amd64.tar.gz"
      sha256 "12995adedc563281ca61fed9bfc606178c20ecc9c8d807b694b6d32cfe850516"
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
