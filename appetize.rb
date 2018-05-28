require "formula"

class Appetize < Formula
  homepage "https://github.com/YusukeIwaki/appetize-cli"
  url "https://github.com/YusukeIwaki/appetize-cli/releases/download/v1.1.0/appetize_darwin_amd64"
  sha256 "c2c23e0bf69885ed65245393e2b516bbd9c19444c0c6a5e5cfccfa52051c3be6"
  head "https://github.com/YusukeIwaki/appetize-cli.git"
  version "v1.1.0"

  def install
    mv "appetize_darwin_amd64", "appetize"
    bin.install "appetize"
  end
end
