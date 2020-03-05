class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  version "0.7.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bufbuild/buf/releases/download/v0.7.1/buf-Darwin-x86_64.tar.gz"
    sha256 "6a2b23eab3028026f404125afc47673fa9fd273b5e47e796ae76c01d6cfe06aa"
  elsif OS.linux?
    url "https://github.com/bufbuild/buf/releases/download/v0.7.1/buf-Linux-x86_64.tar.gz"
    sha256 "8fc435e029bb7eedbd6f96f667a126b0a0ca0289c8894bfd41bd08d91c31e336"
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
