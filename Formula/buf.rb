class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  head "https://github.com/bufbuild/buf.git", branch: "main"
  url "https://github.com/bufbuild/buf/archive/v1.9.0.tar.gz"
  sha256 "d80360b347d799beffbc98aa528d18bf6e6c6ac38a0222a51c028d816db30d20"
  version "1.9.0"

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
