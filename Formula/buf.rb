class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  head "https://github.com/bufbuild/buf.git", branch: "main"
  url "https://github.com/bufbuild/buf/archive/v1.2.0.tar.gz"
  sha256 "26c42b764e4e10fb8bd640e2566aad3ee5fbf2220e0eb9f25fdeb0a4109cc7a6"
  version "1.2.0"

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
