class Buf < Formula
  desc "The best way of working with Protocol Buffers."
  homepage "https://buf.build"
  head "https://github.com/bufbuild/buf.git", branch: "main"
  url "https://github.com/bufbuild/buf/archive/v1.41.0.tar.gz"
  sha256 "b9721906b0bfccffefe1d2c52e2b472dc212e40ff4be49c61d153132c3ce3371"
  version "1.41.0"

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
