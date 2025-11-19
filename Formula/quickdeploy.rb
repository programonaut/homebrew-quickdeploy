  class Quickdeploy < Formula
    desc "One command deployment tool for your web applications"
    homepage "https://quickdeploy.dev"
    version "0.6.3"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/darwin-arm64"
        sha256 "1ed017ba79e60091e41b98ea90f040e4767e5ca84e96a49c78e103063f8d4416" # darwin-arm64
      else
        url "https://quickdeploy.dev/api/download/darwin-amd64"
        sha256 "317a73ce4bce75e79787d8e0d3252f9d31708c4d0bafd09877b2ecb5e91fffe7" # darwin-amd64
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/linux-arm64"
        sha256 "aa8bfd56182f80b5f11a269db034366533ed5704f10b5859bdb01699c4b50410" # linux-arm64
      else
        url "https://quickdeploy.dev/api/download/linux-amd64"
        sha256 "70e4b9e9ee3e469e4f39ead46695c1be1d02dda72dc932a4c5023c9cbcf5253d" # linux-amd64
      end
    end

    def install
      bin.install Dir["*"].first => "quickdeploy"
    end

    test do
      assert_match "QuickDeploy", shell_output("#{bin}/quickdeploy --help")
    end
  end