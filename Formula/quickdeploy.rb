  class Quickdeploy < Formula
    desc "One command deployment tool for your web applications"
    homepage "https://quickdeploy.dev"
    version "0.2.17"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/darwin-arm64"
        sha256 "4d4313c742c63fbaabc5131c10b8d0fc40e6fee22a8ff495bea98c55e79c6be2" # darwin-arm64
      else
        url "https://quickdeploy.dev/api/download/darwin-amd64"
        sha256 "08d91e4c0805b1c35f6c8d72b6d7fe2e52d8a8b4a0d49962490ece82eb7f4f93" # darwin-amd64
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/linux-arm64"
        sha256 "1a22a025771d2e07f8e49f9ce076dddf63b56d6a3fbf0f6350af19f9273a73b4" # linux-arm64
      else
        url "https://quickdeploy.dev/api/download/linux-amd64"
        sha256 "93728aa900bcddf0622f225ad65905860feff645523306e6b0f943a9e01d1793" # linux-amd64
      end
    end

    def install
      bin.install Dir["*"].first => "quickdeploy"
    end

    test do
      assert_match "QuickDeploy", shell_output("#{bin}/quickdeploy --help")
    end
  end