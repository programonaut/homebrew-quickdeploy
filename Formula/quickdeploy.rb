  class Quickdeploy < Formula
    desc "One command deployment tool for your web applications"
    homepage "https://quickdeploy.dev"
    version "0.3.15"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/darwin-arm64"
        sha256 "22f62b8607e8da9803096b35a931708869af4f4c53bf5d5d99f264fcbfe19582" # darwin-arm64
      else
        url "https://quickdeploy.dev/api/download/darwin-amd64"
        sha256 "f79079cc68e347cb4307d9f0d1b025d3a860234f5538ac297338161c1127cdfa" # darwin-amd64
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/linux-arm64"
        sha256 "37a5eb43c85ab3c95475117b2664981cadb92dec35d3b2311c83ae5a409e0cc0" # linux-arm64
      else
        url "https://quickdeploy.dev/api/download/linux-amd64"
        sha256 "a1d1f3577f008fbcc7db7eb43dd7ce6faad3d75b2c21bfaf2d5c4c2de0c1a954" # linux-amd64
      end
    end

    def install
      bin.install Dir["*"].first => "quickdeploy"
    end

    test do
      assert_match "QuickDeploy", shell_output("#{bin}/quickdeploy --help")
    end
  end