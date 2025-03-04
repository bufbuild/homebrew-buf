class Bufstream < Formula
  desc "Drop-in replacement for Apache Kafka with improved data quality and lower costs"
  homepage "https://buf.build/product/bufstream"
  url "https://buf.build/dl/bufstream/v0.3.11/bufstream-v0.3.11-Darwin-arm64" # Default URL for stable bottle generation
  version "0.3.11"
  sha256 "dde00e3eaa0b80f4e4e775845b4ee62b9e6e59f0a4c99d606fa992db4afaa328" # Default SHA for the above URL

  # macOS architecture-specific downloads
  on_macos do
    on_intel do
      url "https://buf.build/dl/bufstream/v#{version}/bufstream-v#{version}-Darwin-x86_64"
      sha256 "04fdaa56c9bd193341f551008b8d27c04aacf028330374c57f5a6e5769da9e92"
    end
    on_arm do
      url "https://buf.build/dl/bufstream/v#{version}/bufstream-v#{version}-Darwin-arm64"
      sha256 "dde00e3eaa0b80f4e4e775845b4ee62b9e6e59f0a4c99d606fa992db4afaa328"
    end
  end

  # Linux architecture-specific downloads
  on_linux do
    on_intel do
      url "https://buf.build/dl/bufstream/v#{version}/bufstream-v#{version}-Linux-x86_64"
      sha256 "892c90dbc8bf9400ddbac900c2e40d8c184519325d61d2757ce794e4c8f4ec4a"
    end
    on_arm do
      url "https://buf.build/dl/bufstream/v#{version}/bufstream-v#{version}-Linux-aarch64"
      sha256 "ad80b4252992b580fd949e3352ca43eb7ae0d7dd4282c0ab017b57355d38f442"
    end
  end

  def install
    bin.install "bufstream-v#{version}-#{OS.kernel_name}-#{Hardware::CPU.arch}" => "bufstream"
  end

  test do
    system "#{bin}/bufstream", "--version"
  end
end
