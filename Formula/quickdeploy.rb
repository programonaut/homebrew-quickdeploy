  class Quickdeploy < Formula
    desc "One command deployment tool for your web applications"
    homepage "https://quickdeploy.dev"
    version "0.3.2"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/darwin-arm64"
        sha256 "0568366a95bd68fc385e300bbdf3ed7c0eca90bf7deda8c864d743d4701d2e9f" # darwin-arm64
      else
        url "https://quickdeploy.dev/api/download/darwin-amd64"
        sha256 "baa0b85d0592b95c3a3915bf31f689f6133a4fdaba168ee0be055cf62c0f5b9d" # darwin-amd64
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/linux-arm64"
        sha256 "c56bd9d7a14d6e925583373e7d028314d4ae77bcc9351b484a1391e074be82d4" # linux-arm64
      else
        url "https://quickdeploy.dev/api/download/linux-amd64"
        sha256 "a75e6ebd8f94818be00dc041f859f186f9d21ac5259a4f0bbbc19d7d17ac4d4d" # linux-amd64
      end
    end

    def install
      bin.install Dir["*"].first => "quickdeploy"
    end

    test do
      assert_match "QuickDeploy", shell_output("#{bin}/quickdeploy --help")
    end
  end