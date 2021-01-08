class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  head "https://github.com/bufbuild/buf.git"
  url "https://github.com/bufbuild/buf/archive/v0.35.1.tar.gz"
  sha256 "e9f3d6b056afd63764f64eae5ee46b2e6d90146872ea3b7c8bc5dadfbf78f4dc"
  version "0.35.1"

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
