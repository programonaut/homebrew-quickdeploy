  class Quickdeploy < Formula
    desc "One command deployment tool for your web applications"
    homepage "https://quickdeploy.dev"
    version "0.3.10"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/darwin-arm64"
        sha256 "bfbcaf54a7adccc094795250d8db451bce213ff2d98f9ed175c07c3e496dd32f" # darwin-arm64
      else
        url "https://quickdeploy.dev/api/download/darwin-amd64"
        sha256 "b7b437d8575b30d5eab51147416bf6bfd0a767ae291e072d5c8d2506448f7bf0" # darwin-amd64
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/linux-arm64"
        sha256 "7ddc08def10423a347366810d9719d17b7612b2d56f841e3f7c1b45b550cd4d5" # linux-arm64
      else
        url "https://quickdeploy.dev/api/download/linux-amd64"
        sha256 "dd24bf2ed9b4c64236104ef8258b0fb099a20b3074657561388554625483137c" # linux-amd64
      end
    end

    def install
      bin.install Dir["*"].first => "quickdeploy"
    end

    test do
      assert_match "QuickDeploy", shell_output("#{bin}/quickdeploy --help")
    end
  end