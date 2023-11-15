class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  head "https://github.com/bufbuild/buf.git", branch: "main"
  url "https://github.com/bufbuild/buf/archive/v1.28.1.tar.gz"
  sha256 "4ccc872e26edffaa99baa43d7091dcff50347bb8132a57b97880385d7742c82d"
  version "1.28.1"

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
