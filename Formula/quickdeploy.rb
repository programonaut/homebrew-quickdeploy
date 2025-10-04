  class Quickdeploy < Formula
    desc "One command deployment tool for your web applications"
    homepage "https://quickdeploy.dev"
    version "0.4.0"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/darwin-arm64"
        sha256 "e1cc6d2b711831e683d554b00bc491c58b123d1bc7402e91af10139c470c1775" # darwin-arm64
      else
        url "https://quickdeploy.dev/api/download/darwin-amd64"
        sha256 "d9a500ffa54d93202a568d72feca0d4397b8e62e462bf2f97e0d029f367f4290" # darwin-amd64
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/linux-arm64"
        sha256 "347cdc309f75d720f72c5f3d57bbc109bedd86cfd62893d42514dc2b2562c167" # linux-arm64
      else
        url "https://quickdeploy.dev/api/download/linux-amd64"
        sha256 "b4bedd464ff094eeb8f5bfbd2f01c1fbec6b8ef2f884c36f5875dc8c0efe88b8" # linux-amd64
      end
    end

    def install
      bin.install Dir["*"].first => "quickdeploy"
    end

    test do
      assert_match "QuickDeploy", shell_output("#{bin}/quickdeploy --help")
    end
  end