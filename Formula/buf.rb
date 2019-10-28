class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  version "0.2.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bufbuild/buf/releases/download/v0.2.0/buf-Darwin-x86_64.tar.gz"
    sha256 "e3cf0b37d8a897c1986cfce7e512a360db92d9f4460ac65224a16ca1b341f8c6"
  elsif OS.linux?
    url "https://github.com/bufbuild/buf/releases/download/v0.2.0/buf-Linux-x86_64.tar.gz"
    sha256 "ad4e978c24fb13b7f74d92477a72ce8a92be1dea6f0d1975b30ee9bb2d55110e"
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
