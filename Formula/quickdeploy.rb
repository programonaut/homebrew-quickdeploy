  class Quickdeploy < Formula
    desc "One command deployment tool for your web applications"
    homepage "https://quickdeploy.dev"
    version "0.3.13"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/darwin-arm64"
        sha256 "78ea31a7dc71fa096edda7a3e8eb063ec354315b1bad88126771c19ac8fa35ae" # darwin-arm64
      else
        url "https://quickdeploy.dev/api/download/darwin-amd64"
        sha256 "6658d08b718bc5140972372016dd14e481bddaf7e604a5c3b58467b61cf4bcf9" # darwin-amd64
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/linux-arm64"
        sha256 "1211d45e485338ce5b250f2bb36c46517bab9c72b22960b841e0de7d76bd69d4" # linux-arm64
      else
        url "https://quickdeploy.dev/api/download/linux-amd64"
        sha256 "f462fa9ee326ed585e74eedb7ae080d9025c4ea123340ef743858d221605379a" # linux-amd64
      end
    end

    def install
      bin.install Dir["*"].first => "quickdeploy"
    end

    test do
      assert_match "QuickDeploy", shell_output("#{bin}/quickdeploy --help")
    end
  end