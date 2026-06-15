class Buf < Formula
  desc "The best way of working with Protocol Buffers."
  homepage "https://buf.build"
  version "1.70.0"

  # sha256 of the prebuilt release archive for each Homebrew-supported platform,
  # keyed by "#{OS.kernel_name}-#{Hardware::CPU.arch}". Each archive unpacks to
  # the same layout as a source build (bin/, etc/, share/, LICENSE), so the two
  # install paths below are equivalent.
  SHA256S = {
    "Darwin-arm64"  => "9cec23658df093d50f3318580e17f1e309d45b817927f22e9de30f78f3d4d45b",
    "Darwin-x86_64" => "ebeed1af15bcb145c35c5e51eadc8fe0bdba9311e08fd6abca8c23294929d20b",
    "Linux-arm64"   => "ff3c79a6bb44c41a8053ec0d863234cee82378ea4c29ed5292c852dbf829fec0",
    "Linux-x86_64"  => "18498bdadbdce80792ce08c2c59e0c49f157aa3f5d9b0f9c6e3db795be208b9d",
  }.freeze

  if (sha = SHA256S["#{OS.kernel_name}-#{Hardware::CPU.arch}"])
    # Homebrew reports 64-bit ARM as "arm64"; the Linux asset is named "aarch64".
    asset_arch = Hardware::CPU.arch.to_s
    asset_arch = "aarch64" if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/bufbuild/buf/releases/download/v#{version}/buf-#{OS.kernel_name}-#{asset_arch}.tar.gz"
    sha256 sha
  else
    # No prebuilt binary for this platform: fall back to building from source.
    url "https://github.com/bufbuild/buf/archive/v#{version}.tar.gz"
    sha256 "7da0f12d42d00a4a4fabf89af37e2e02ad5958bc7e977a713e4bc01b2a232899"
    depends_on "go" => :build
  end

  head do
    url "https://github.com/bufbuild/buf.git", branch: "main"
    depends_on "go" => :build
  end

  def install
    if build.head? || !SHA256S.key?("#{OS.kernel_name}-#{Hardware::CPU.arch}")
      ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
      system "sh", "make/buf/scripts/brew.sh", ".build/brew"
      prefix.install Dir[".build/brew/*"]
    else
      prefix.install Dir["*"]
    end
  end

  test do
    system "#{bin}/buf --version"
  end
end
