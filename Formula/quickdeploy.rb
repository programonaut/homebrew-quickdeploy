  class Quickdeploy < Formula
    desc "One command deployment tool for your web applications"
    homepage "https://quickdeploy.dev"
    version "0.6.1"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/darwin-arm64"
        sha256 "a39d813590b73f64c05ec98e4738050c8f733601d7c43ae69103ede4a0abfe4e" # darwin-arm64
      else
        url "https://quickdeploy.dev/api/download/darwin-amd64"
        sha256 "9602a37410b433ec09b5a4aa1dd2a8abc765f527f339b461ddb6355967201dab" # darwin-amd64
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/linux-arm64"
        sha256 "364c3cc1eabf4086ccf549dc8c32d2f97a9c002426e6db183e2c90dd0bb40a51" # linux-arm64
      else
        url "https://quickdeploy.dev/api/download/linux-amd64"
        sha256 "5acc2e99739826fb03ee244853b76150ef2f2358f719e3601867eddd9a410c68" # linux-amd64
      end
    end

    def install
      bin.install Dir["*"].first => "quickdeploy"
    end

    test do
      assert_match "QuickDeploy", shell_output("#{bin}/quickdeploy --help")
    end
  end