  class Quickdeploy < Formula
    desc "One command deployment tool for your web applications"
    homepage "https://quickdeploy.dev"
    version "0.3.9"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/darwin-arm64"
        sha256 "0928399749123dea893cb94a9ea550effc29e376fde1a0e0219c73f3e41ecda1" # darwin-arm64
      else
        url "https://quickdeploy.dev/api/download/darwin-amd64"
        sha256 "d6de92c1148ba52a0f9f5a55050c7edf77c5fb6c67d61e92b561d223bab80f1c" # darwin-amd64
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/linux-arm64"
        sha256 "7ddc08def10423a347366810d9719d17b7612b2d56f841e3f7c1b45b550cd4d5" # linux-arm64
      else
        url "https://quickdeploy.dev/api/download/linux-amd64"
        sha256 "bcf62b599c6d99ee8619c31e2efea3b188548e0bae2ffd88ea98a8fdb2261663" # linux-amd64
      end
    end

    def install
      bin.install Dir["*"].first => "quickdeploy"
    end

    test do
      assert_match "QuickDeploy", shell_output("#{bin}/quickdeploy --help")
    end
  end