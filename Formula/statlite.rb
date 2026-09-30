class Statlite < Formula
  desc "Tiny self-hosted metrics dashboard for small servers"
  homepage "https://github.com/PVRLabs/statlite"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.5.1/statlite_0.5.1_darwin_arm64.tar.gz"
      sha256 "aaf778075bac9e6cfcb7dbf141b7f168e5206a64db84d0135284f49a103349d0"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.5.1/statlite_0.5.1_darwin_amd64.tar.gz"
      sha256 "c088b437ed87ffb50c648b8287b91319c23296326242f8de0cc417451a74f760"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.5.1/statlite_0.5.1_linux_arm64.tar.gz"
      sha256 "ceb27115656c15d3ff30e1f17c4d953a8f5fcd0358229dd54239ccfc8d622392"
    end

    on_intel do
      url "https://github.com/PVRLabs/statlite/releases/download/v0.5.1/statlite_0.5.1_linux_amd64.tar.gz"
      sha256 "4e8802c0416f5f00a8e8fa4f5034c23d3165135216d2668ecaed899d1e59e925"
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
