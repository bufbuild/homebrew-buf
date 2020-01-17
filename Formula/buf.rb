class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  version "0.6.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bufbuild/buf/releases/download/v0.6.0/buf-Darwin-x86_64.tar.gz"
    sha256 "13445d81c0f4fb2e46824d1dc813d9280346e73b8f7d0a6504d1156969b4aabc"
  elsif OS.linux?
    url "https://github.com/bufbuild/buf/releases/download/v0.6.0/buf-Linux-x86_64.tar.gz"
    sha256 "c8f27b08f226ef6482cbd1cc4296e8fdbd64d428f5ad5636b32258477c26d4b4"
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
