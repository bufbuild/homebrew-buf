class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  head "https://github.com/bufbuild/buf.git"
  url "https://github.com/bufbuild/buf/archive/v0.39.1.tar.gz"
  sha256 "7608c5ad489d1d11c80230b6a4e5f55aa9a64351f0fff7e52a3dbadfbac6925d"
  version "0.39.1"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
    ENV["GOENV"] = HOMEBREW_CACHE/"../../../Library/Application Support/go/env"
    system "sh", "make/buf/scripts/brew.sh", ".build/brew"
    prefix.install Dir[".build/brew/*"]
  end

  test do
    system "#{bin}/buf --version"
  end
end
