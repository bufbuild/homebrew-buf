class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  head "https://github.com/bufbuild/buf.git"
  url "https://github.com/bufbuild/buf/archive/v0.20.5.tar.gz"
  sha256 "f02f0e51f41cbd8bf6dce33878fb665309c40d258e6d370be89245260e429985"
  version "0.20.5"

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
