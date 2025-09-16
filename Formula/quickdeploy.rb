  class Quickdeploy < Formula
    desc "One command deployment tool for your web applications"
    homepage "https://quickdeploy.dev"
    version "0.3.3"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/darwin-arm64"
        sha256 "38fc6fc7b38dab0c603e53d502c1918c9021605c70fcf1729732c372e31aa946" # darwin-arm64
      else
        url "https://quickdeploy.dev/api/download/darwin-amd64"
        sha256 "b253a5e544edd9730884a9cbac23855923fb407b029ddc19f902b61a6149712d" # darwin-amd64
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/linux-arm64"
        sha256 "c56bd9d7a14d6e925583373e7d028314d4ae77bcc9351b484a1391e074be82d4" # linux-arm64
      else
        url "https://quickdeploy.dev/api/download/linux-amd64"
        sha256 "a71a72bd05a0ba2f27dd5c5ea5cfe30e43238ef54accdb9c18e3a6d8753262a5" # linux-amd64
      end
    end

    def install
      bin.install Dir["*"].first => "quickdeploy"
    end

    test do
      assert_match "QuickDeploy", shell_output("#{bin}/quickdeploy --help")
    end
  end