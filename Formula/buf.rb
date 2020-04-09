class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  head "https://github.com/bufbuild/buf.git"
  url "https://github.com/bufbuild/buf/archive/v0.11.0.tar.gz"
  sha256 "7528dc718e901bb70be8d71ad8c816c05283ea4f0c19541e4498f5ecdddc7db5"
  version "0.11.0"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
    system "sh", "make/buf/scripts/brew.sh", ".build/brew"
    prefix.install Dir[".build/brew/*"]
  end

  test do
    system "#{bin}/buf --version"
  end
end
