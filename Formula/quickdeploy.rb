  class Quickdeploy < Formula
    desc "One command deployment tool for your web applications"
    homepage "https://quickdeploy.dev"
    version "0.3.11"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/darwin-arm64"
        sha256 "7a2cb38f9fcfd6c48f3659ab04b7606b95711922a9e45bb9af8048dea7d5f6e4" # darwin-arm64
      else
        url "https://quickdeploy.dev/api/download/darwin-amd64"
        sha256 "e5400460bd8112cee1c9e4b85ea5f1b51cae4a9209e5a623af567965523f0d03" # darwin-amd64
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://quickdeploy.dev/api/download/linux-arm64"
        sha256 "78109935100eb06e54cf09282500738350a6ba505d67a14dc28b9b053f1928ac" # linux-arm64
      else
        url "https://quickdeploy.dev/api/download/linux-amd64"
        sha256 "7e9496ffece2f4585d535d956f5595d35d3aa07a8dcc16af3b4e9771411bf4f7" # linux-amd64
      end
    end

    def install
      bin.install Dir["*"].first => "quickdeploy"
    end

    test do
      assert_match "QuickDeploy", shell_output("#{bin}/quickdeploy --help")
    end
  end