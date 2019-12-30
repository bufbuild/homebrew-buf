class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  version "0.4.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bufbuild/buf/releases/download/v0.4.1/buf-Darwin-x86_64.tar.gz"
    sha256 "d2c15196a255f1404be3023b573611c9444a311e1df6e0013b5a6c2467a6cfff"
  elsif OS.linux?
    url "https://github.com/bufbuild/buf/releases/download/v0.4.1/buf-Linux-x86_64.tar.gz"
    sha256 "1dc05e79e82326dbd9633eb240975dbd69a41758fec49f579d390ba8c08d95ed"
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
