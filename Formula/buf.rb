class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  version "0.9.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bufbuild/buf/releases/download/v0.9.0/buf-Darwin-x86_64.tar.gz"
    sha256 "96653f1e54ec54bc47a157bbeed6036b8da4ce00477cd10e6d9189dd86acc94b"
  elsif OS.linux?
    url "https://github.com/bufbuild/buf/releases/download/v0.9.0/buf-Linux-x86_64.tar.gz"
    sha256 "faebc39056a92e28df7a0d5ec7860468ff33289ae2e3cacc1f081f8f00c52849"
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
