class Bufstream < Formula
  desc "Drop-in replacement for Apache Kafka with improved data quality and lower costs"
  homepage "https://buf.build/product/bufstream"
  version "0.3.12"
  url "https://buf.build/dl/bufstream/v#{version}/bufstream-v#{version}-Darwin-arm64" # Default URL for stable bottle generation
  sha256 "30b3f9169fcc9ac11043c9e9d81334659b97e49c07a15bf1c35a1c696e7eb65c" # Default SHA for the above URL

  checksums = {
    "darwin-arm64" => "30b3f9169fcc9ac11043c9e9d81334659b97e49c07a15bf1c35a1c696e7eb65c",
    "darwin-x86_64" => "999c70572d9761b5edc1bc90ab9d6da0a766e8449765b06fe77b04d7e4858359",
    "linux-arm64" => "a2ed8582e728b63bfcb6117a4134ac80e118bdfa1f8566685cab3ec9ed5e3ac5",
    "linux-x86_64" => "d7111074ce5cba9827139884484f861dba53c6f1ca3be29f6f5d7247a2e45894",
  }

  on_macos do
    on_intel do
      url "https://buf.build/dl/bufstream/v#{version}/bufstream-v#{version}-Darwin-x86_64"
      sha256 checksums["darwin-x86_64"]
    end
    on_arm do
      url "https://buf.build/dl/bufstream/v#{version}/bufstream-v#{version}-Darwin-arm64"
      sha256 checksums["darwin-arm64"]
    end
  end

  on_linux do
    on_intel do
      url "https://buf.build/dl/bufstream/v#{version}/bufstream-v#{version}-Linux-x86_64"
      sha256 checksums["linux-x86_64"]
    end
    on_arm do
      url "https://buf.build/dl/bufstream/v#{version}/bufstream-v#{version}-Linux-aarch64"
      sha256 checksums["linux-arm64"]
    end
  end

  def install
    bin.install "bufstream-v#{version}-#{OS.kernel_name}-#{Hardware::CPU.arch}" => "bufstream"
  end

  test do
    system "#{bin}/bufstream", "--version"
  end
end
