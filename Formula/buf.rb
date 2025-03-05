class Buf < Formula
  desc "The best way of working with Protocol Buffers."
  homepage "https://buf.build"
  version "1.50.0"
  url "https://github.com/bufbuild/buf/releases/download/v#{version}/buf-Darwin-arm64"
  sha256 "4a215517d0bcb37c47b9178e2668d7651a7fef9a482cef482227ad09796cdfc0"

  checksums = {
    "darwin-arm64" => "4a215517d0bcb37c47b9178e2668d7651a7fef9a482cef482227ad09796cdfc0",
    "darwin-x86_64" => "baaf26b33519fe4494729aab9b02cea449a134ed028b5c21d16ca42734da76e4",
    "linux-arm64" => "5d630153d4d7aae1093f964ed15f1391ce9288f2d4192a4818c18443b3565bbf",
    "linux-x86_64" => "154ea883ce098eac4fa106ff9ee4e4964bb97f809dd8ec9c34a432b466ce1494",
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
