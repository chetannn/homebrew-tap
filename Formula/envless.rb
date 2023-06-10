require "language/node"

class Envless < Formula
  desc ""
  homepage "https://envless.dev"
  url "https://s3.amazonaws.com/testingcli.envless.dev/channels/stable/envless-darwin-x64.tar.gz"
  sha256 "6cd2be32636611c9081d983712cfd7a9df75784bdfd403e3f7320cc25a68be47"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://s3.amazonaws.com/testingcli.envless.dev/channels/stable/envless-darwin-arm64.tar.gz"
      sha256 "2e509af2c2da98b513de4ddba26d07ea949882a9c599cacc144440878a1866e0"
    end
  end

 def install
     inreplace "bin/envless", /^CLIENT_HOME=/, "export ENVLESS_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
     libexec.install Dir["*"]
     bin.install_symlink libexec/"bin/envless"
  end

  test do
    system "#{bin}/envless version"
  end
end
