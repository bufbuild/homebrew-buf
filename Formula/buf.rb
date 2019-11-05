class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  version "0.3.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bufbuild/buf/releases/download/v0.3.0/buf-Darwin-x86_64.tar.gz"
    sha256 "4f3735d8c9686ab4e0d79ba497981cc9ab19407eee1192fec57265149685ece3"
  elsif OS.linux?
    url "https://github.com/bufbuild/buf/releases/download/v0.3.0/buf-Linux-x86_64.tar.gz"
    sha256 "86901c1b2f80e4d582cc82d45dc025ad0a2e4f4544c48f932aa8a17bd6948bc4"
  end

  def install
    bin.install "bin/buf"
    bin.install "bin/protoc-gen-buf-check-breaking"
    bin.install "bin/protoc-gen-buf-check-lint"
    bash_completion.install "etc/bash_completion.d/buf"
    zsh_completion.install "etc/zsh/site-functions/_buf"
    prefix.install "LICENSE"
  end

  test do
    system "#{bin}/buf --version"
  end
end
