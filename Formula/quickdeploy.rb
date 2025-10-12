  class Quickdeploy < Formula
    desc "One command deployment tool for your web applications"
    homepage "https://quickdeploy.dev"
    version "0.6.0"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/darwin-arm64"
        sha256 "5fb7cef3592180f9bcffff42b9f6b4c28c232c2ec1c5476848b53f1ee916cb99" # darwin-arm64
      else
        url "https://quickdeploy.dev/api/download/darwin-amd64"
        sha256 "75bd0c692fe7f388601e8e2693192efd253551203403e8dc01a54e6735c79bbb" # darwin-amd64
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/linux-arm64"
        sha256 "364c3cc1eabf4086ccf549dc8c32d2f97a9c002426e6db183e2c90dd0bb40a51" # linux-arm64
      else
        url "https://quickdeploy.dev/api/download/linux-amd64"
        sha256 "eb84878129fa5f9be849c9a934c93449abc8976682db366855aeb6ac066befdd" # linux-amd64
      end
    end

    def install
      bin.install Dir["*"].first => "quickdeploy"
    end

    test do
      assert_match "QuickDeploy", shell_output("#{bin}/quickdeploy --help")
    end
  end