class Buf < Formula
  desc "The best way of working with Protocol Buffers."
  homepage "https://buf.build"
  head "https://github.com/bufbuild/buf.git", branch: "main"
  url "https://github.com/bufbuild/buf/archive/v1.65.0.tar.gz"
  sha256 "386b49aaa2d763fa5d73ff2eb7e88fff89c6b1feacdc6b5e1badc1a173d79fbf"
  version "1.65.0"

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
