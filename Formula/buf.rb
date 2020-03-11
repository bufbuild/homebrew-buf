class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  version "0.8.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bufbuild/buf/releases/download/v0.8.0/buf-Darwin-x86_64.tar.gz"
    sha256 "1b836a5adfdd77104a75dbe50f0439415fcc29eeda5f58ec182c53db6ae5df72"
  elsif OS.linux?
    url "https://github.com/bufbuild/buf/releases/download/v0.8.0/buf-Linux-x86_64.tar.gz"
    sha256 "2cc74ee9b389027086fdec5d2f365bb27a07b5b610c120154e187ea74f5a59d7"
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
