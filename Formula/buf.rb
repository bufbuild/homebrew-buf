class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  head "https://github.com/bufbuild/buf.git"
  url "https://github.com/bufbuild/buf/archive/v0.51.1.tar.gz"
  sha256 "51a9a529611010b74cd4056d0f536ec758bb3e41945c2201ef9293cde0440019"
  version "0.51.1"

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
