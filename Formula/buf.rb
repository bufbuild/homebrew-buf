class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  version "0.5.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/bufbuild/buf/releases/download/v0.5.0/buf-Darwin-x86_64.tar.gz"
    sha256 "e900293dd9681820b171c4b44f93403f91cb45c534b98d75684ce9b61825963a"
  elsif OS.linux?
    url "https://github.com/bufbuild/buf/releases/download/v0.5.0/buf-Linux-x86_64.tar.gz"
    sha256 "20675856e1f638f866297d31095db4cf9bd329dba267f034c88801f2179c807e"
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
