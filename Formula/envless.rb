require "language/node"

class Envless < Formula
  desc ""
  homepage "https://envless.dev"
  url "https://s3.amazonaws.com/testingcli.envless.dev/versions/0.0.4/ad15691/envless-v0.0.4-ad15691-darwin-arm64.tar.xz"
  sha256 "8ce5dfa9677b7cec08c1b6ca5b42c49c8f0df83afdfdea5de54ad02363e66afa"
  depends_on "node"
   

  def install
     inreplace "bin/envless", /^CLIENT_HOME=/, "export ENVLESS_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
  end

  test do
    system "#{bin}/envless version"
  end
end
