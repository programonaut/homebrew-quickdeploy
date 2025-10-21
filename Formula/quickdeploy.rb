  class Quickdeploy < Formula
    desc "One command deployment tool for your web applications"
    homepage "https://quickdeploy.dev"
    version "0.6.2"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/darwin-arm64"
        sha256 "b4c79d25a8c418c5f2246c4ff79dd736daf678343e358e245a7a838438717f24" # darwin-arm64
      else
        url "https://quickdeploy.dev/api/download/darwin-amd64"
        sha256 "539230a540dab55e30436cd23f1b3f4aae1a5baa3b449084a499b360fabd930a" # darwin-amd64
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/linux-arm64"
        sha256 "364c3cc1eabf4086ccf549dc8c32d2f97a9c002426e6db183e2c90dd0bb40a51" # linux-arm64
      else
        url "https://quickdeploy.dev/api/download/linux-amd64"
        sha256 "20ce2d73c3cd3452eeb637e1636079ab53dee34e48d0d83b498b5f7155fccf5c" # linux-amd64
      end
    end

    def install
      bin.install Dir["*"].first => "quickdeploy"
    end

    test do
      assert_match "QuickDeploy", shell_output("#{bin}/quickdeploy --help")
    end
  end