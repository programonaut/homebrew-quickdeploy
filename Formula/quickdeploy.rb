  class Quickdeploy < Formula
    desc "One command deployment tool for your web applications"
    homepage "https://quickdeploy.dev"
    version "0.3.1"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/darwin-arm64"
        sha256 "e8d45d3f21021972ca09f21f8df43f6680b9d30dc52d2492db3e2bd56b53eb99" # darwin-arm64
      else
        url "https://quickdeploy.dev/api/download/darwin-amd64"
        sha256 "d66513a70ef235f62a0adf9e4684414c2dd25f2247bb7e61bdcd0d6aa46fc3f6" # darwin-amd64
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/linux-arm64"
        sha256 "c56bd9d7a14d6e925583373e7d028314d4ae77bcc9351b484a1391e074be82d4" # linux-arm64
      else
        url "https://quickdeploy.dev/api/download/linux-amd64"
        sha256 "c30e10786fc848d6af82daef9c95325954dafc07a7ee3b6ad33fd486bd62327b" # linux-amd64
      end
    end

    def install
      bin.install Dir["*"].first => "quickdeploy"
    end

    test do
      assert_match "QuickDeploy", shell_output("#{bin}/quickdeploy --help")
    end
  end