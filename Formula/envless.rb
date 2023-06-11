require "language/node"

class Envless < Formula
  desc ""
  homepage "https://envless.dev"
  url "https://s3.amazonaws.com/testingcli.envless.dev/channels/stable/envless-darwin-x64.tar.gz"
  sha256 "db12cfcec9724e48591d48397f5fa50847c56a31050e16330dca74d90683ea9a"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://s3.amazonaws.com/testingcli.envless.dev/channels/stable/envless-darwin-arm64.tar.gz"
      sha256 "fb47a1e08f39a31cdd92eea0c50d3341a19f726f74b78e2e9cd01d2c45e87bed"
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
