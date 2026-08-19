class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_darwin_arm64.tar.gz"
      sha256 "e09bfe8936db70be5394a26d0547ffadd332bda4a074fca9048c557ece02aaee"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_darwin_amd64.tar.gz"
      sha256 "a436596cc98e989ba547d5de05876ec3d38a62a7a58183cd4dee7719476317f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_linux_arm64.tar.gz"
      sha256 "b0d262859118b610a6821442b3679907a6c6ef959fb65e3353e1b3bbde5cf968"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v#{version}/statlite_#{version}_linux_amd64.tar.gz"
      sha256 "b0c1bfeef082d31ecee0fa175d0314eb46a746ba1592aecf9027e827d6544ab9"
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
