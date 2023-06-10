require "language/node"

class Envless < Formula
  desc ""
  homepage "https://envless.dev"
  url "https://s3.amazonaws.com/testingcli.envless.dev/channels/stable/envless-darwin-x64.tar.gz"
  sha256 "7a2b8bc14c2021a427dd0d9053179ea965b1a8ca11bfabf1c8c56f4da370a8d9"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://s3.amazonaws.com/testingcli.envless.dev/channels/stable/envless-darwin-arm64.tar.gz"
      sha256 "0e06f3d6029c4704c57acef58d41c001be7c66bbf0da7c08f4e188d65a6f0bfe"
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
