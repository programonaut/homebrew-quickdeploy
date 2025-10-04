  class Quickdeploy < Formula
    desc "One command deployment tool for your web applications"
    homepage "https://quickdeploy.dev"
    version "0.4.1"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/darwin-arm64"
        sha256 "84a41af015abb8b24fea4612f1c2a54c7f4e6fa873682558dbd3971777371c01" # darwin-arm64
      else
        url "https://quickdeploy.dev/api/download/darwin-amd64"
        sha256 "eccedbf9e2895b9019e53512fab1885274f8ff8a7ce32b06d7e427c2a228e323" # darwin-amd64
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/linux-arm64"
        sha256 "8156d415c17ec436c76c50eb61ad248f6bc8047cab0bceac6d4d1d6d6fed6bbb" # linux-arm64
      else
        url "https://quickdeploy.dev/api/download/linux-amd64"
        sha256 "4f17526f6e90ed36a12c2e25a3259d9e3f672fd8dc49f1b8038cecb6b010c325" # linux-amd64
      end
    end

    def install
      bin.install Dir["*"].first => "quickdeploy"
    end

    test do
      assert_match "QuickDeploy", shell_output("#{bin}/quickdeploy --help")
    end
  end