  class Quickdeploy < Formula
    desc "One command deployment tool for your web applications"
    homepage "https://quickdeploy.dev"
    version "0.5.0"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/darwin-arm64"
        sha256 "e16b3d4e4b9023274ff5f96c1f9d7eea6d213932d5d583e151d2be4f0d5362dd" # darwin-arm64
      else
        url "https://quickdeploy.dev/api/download/darwin-amd64"
        sha256 "174ad27844fb7c1b7f21c2e2666e464ea145f8c161bac7282cd5e40b7f49083b" # darwin-amd64
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/linux-arm64"
        sha256 "2f5e509072203327df0277c83e1e5010427825bdc7201c8e275cc8eeb5ab3858" # linux-arm64
      else
        url "https://quickdeploy.dev/api/download/linux-amd64"
        sha256 "1763af26d29bb62b58103da558631e68918f658932ca4ace75ed2d3757153ac7" # linux-amd64
      end
    end

    def install
      bin.install Dir["*"].first => "quickdeploy"
    end

    test do
      assert_match "QuickDeploy", shell_output("#{bin}/quickdeploy --help")
    end
  end