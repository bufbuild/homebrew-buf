class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  version "0.7.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bufbuild/buf/releases/download/v0.7.0/buf-Darwin-x86_64.tar.gz"
    sha256 "7a3dd1dd68cd94695fa89414e1f3ff709db96faba94e644e9061828b6b6f19c1"
  elsif OS.linux?
    url "https://github.com/bufbuild/buf/releases/download/v0.7.0/buf-Linux-x86_64.tar.gz"
    sha256 "7fe0c2d1b958bc5d2434eaaac2e8278808dd22b7e595cbf2b97b0d23dd8e9d02"
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
