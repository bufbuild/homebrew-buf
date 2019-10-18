class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  version "0.1.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bufbuild/buf/releases/download/v0.1.0/buf-Darwin-x86_64.tar.gz"
    sha256 "aea1d7a73aac1d1e835b337a715a6b10de6a8cf477aa8d8947ecc9104752746e"
  elsif OS.linux?
    url "https://github.com/bufbuild/buf/releases/download/v0.1.0/buf-Linux-x86_64.tar.gz"
    sha256 "37a7ee2764262b09558093fb2f4eede7ab88d9601a34b4b8f0951e3ba8c82e06"
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
