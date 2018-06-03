require "formula"

class Appetize < Formula
  homepage "https://github.com/YusukeIwaki/appetize-cli"
  url "https://github.com/YusukeIwaki/appetize-cli/releases/download/v1.1.1/appetize_darwin_amd64"
  sha256 "12875d28aaf8c00dbfcb5e5c54eace9b09e79bd324344b6e52b8c804293493f2"
  head "https://github.com/YusukeIwaki/appetize-cli.git"
  version "v1.1.1"

  def install
    mv "appetize_darwin_amd64", "appetize"
    bin.install "appetize"
  end
end
