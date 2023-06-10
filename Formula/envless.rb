require "language/node"

class Envless < Formula
  desc ""
  homepage "https://envless.dev"
  url "https://s3.amazonaws.com/testingcli.envless.dev/channels/stable/envless-darwin-x64.tar.gz"
  sha256 "[object Promise]"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://s3.amazonaws.com/testingcli.envless.dev/channels/stable/envless-darwin-arm64.tar.gz"
      sha256 "[object Promise]"
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
