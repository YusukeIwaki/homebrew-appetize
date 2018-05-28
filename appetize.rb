require "formula"

class Appetize < Formula
  homepage "https://github.com/YusukeIwaki/appetize-cli"
  url "https://github.com/YusukeIwaki/appetize-cli/releases/download/v1.0.0/appetize_darwin_amd64"
  sha256 "bcfaee4187e300c0597d15ac5cb1a3561bcbf187a67d48dc63875bcf0d2e455d"
  head "https://github.com/YusukeIwaki/appetize-cli.git"
  version "v1.0.0"

  def install
    mv "appetize_darwin_amd64", "appetize"
    bin.install "appetize"
  end
end
