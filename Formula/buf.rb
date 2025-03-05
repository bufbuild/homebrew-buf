class Buf < Formula
  desc "The best way of working with Protocol Buffers."
  homepage "https://buf.build"
  version "1.48.0"
  url "https://github.com/bufbuild/buf/releases/download/v#{version}/buf-Darwin-arm64"
  sha256 "6ef7df6116c72ef3ccaa8574c9b8008389f0911c1921da4689e0abff3924a4bd"

  checksums = {
    "darwin-arm64" => "6ef7df6116c72ef3ccaa8574c9b8008389f0911c1921da4689e0abff3924a4bd",
    "darwin-x86_64" => "5af7155250ad8af5f0a2f5701d1df83bfece53dfe98f13b3768d808468fcdbde",
    "linux-arm64" => "76b531e2c29be3b0ddf8b1034126b56506532b47c98b3968a49f09432536f39d",
    "linux-x86_64" => "30cbac88a3cdda6e48dcf727f3cf9d2669d771c5d5be94f37e202c76a522b66e",
  }

  on_macos do
    on_arm do
      url "https://github.com/bufbuild/buf/releases/download/v#{version}/buf-Darwin-arm64"
      sha256 checksums["darwin-arm64"]
    end
    on_intel do
      url "https://github.com/bufbuild/buf/releases/download/v#{version}/buf-Darwin-x86_64"
      sha256 checksums["darwin-x86_64"]
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bufbuild/buf/releases/download/v#{version}/buf-Linux-aarch64"
      sha256 checksums["linux-arm64"]
    end
    on_intel do
      url "https://github.com/bufbuild/buf/releases/download/v#{version}/buf-Linux-x86_64"
      sha256 checksums["linux-x86_64"]
    end
  end

  def install
    bin.install "buf-#{OS.kernel_name}-#{Hardware::CPU.arch}" => "buf"
  end

  test do
    system "#{bin}/buf --version"
  end
end
