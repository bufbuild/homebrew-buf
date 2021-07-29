class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  head "https://github.com/bufbuild/buf.git"
  url "https://github.com/bufbuild/buf/archive/v0.48.0.tar.gz"
  sha256 "3ba1460b02936bddf894cfa62b728fd2ebdd096cdab1eb273f7e9877b06e8425"
  version "0.48.0"

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
