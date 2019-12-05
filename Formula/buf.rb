class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  version "0.4.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bufbuild/buf/releases/download/v0.4.0/buf-Darwin-x86_64.tar.gz"
    sha256 "614ed6d52c78835b5959a45bdf267305f13633c97e9047f944aa19bb66f9ab8a"
  elsif OS.linux?
    url "https://github.com/bufbuild/buf/releases/download/v0.4.0/buf-Linux-x86_64.tar.gz"
    sha256 "358bd843e895d0f85141b22d285f8bedc08fb2f6865762b77071e11030911444"
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
