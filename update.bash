#!/usr/bin/env bash

set -eo pipefail

DIR="$(cd "$(dirname "${0}")" && pwd)"
cd "${DIR}"

sha256() {
  if ! type sha256sum >/dev/null 2>/dev/null; then
    if ! type shasum >/dev/null 2>/dev/null; then
      echo "sha256sum and shasum are not installed" >&2
      return 1
    else
      shasum -a 256 "$@"
    fi
  else
    sha256sum "$@"
  fi
}

if [ -z "${1}" ]; then
  echo "usage: ${0} version" >&2
  exit 1
fi

VERSION="${1}"
RELEASE="https://github.com/bufbuild/buf/releases/download/v${VERSION}"

# Source archive checksum, used by the build-from-source fallback.
SOURCE_URL="https://github.com/bufbuild/buf/archive/v${VERSION}.tar.gz"
SOURCE_SHA256=$(curl -sSL "${SOURCE_URL}" | sha256 | cut -f 1 -d ' ')

# Prebuilt archive checksums, sourced in one fetch from the release sha256.txt.
SHA256_TXT=$(curl -sSL "${RELEASE}/sha256.txt")
binary_sha256() {
  echo "${SHA256_TXT}" | awk -v f="${1}" '$2 == f { print $1 }'
}
DARWIN_ARM64_SHA256=$(binary_sha256 "buf-Darwin-arm64.tar.gz")
DARWIN_X86_64_SHA256=$(binary_sha256 "buf-Darwin-x86_64.tar.gz")
LINUX_ARM64_SHA256=$(binary_sha256 "buf-Linux-aarch64.tar.gz")
LINUX_X86_64_SHA256=$(binary_sha256 "buf-Linux-x86_64.tar.gz")

for name in SOURCE_SHA256 DARWIN_ARM64_SHA256 DARWIN_X86_64_SHA256 LINUX_ARM64_SHA256 LINUX_X86_64_SHA256; do
  if [ -z "${!name}" ]; then
    echo "error: could not determine ${name} for v${VERSION}" >&2
    exit 1
  fi
done

rm -rf Formula
mkdir -p Formula
cat <<EOF >Formula/buf.rb
class Buf < Formula
  desc "The best way of working with Protocol Buffers."
  homepage "https://buf.build"
  version "${VERSION}"

  # sha256 of the prebuilt release archive for each Homebrew-supported platform,
  # keyed by "#{OS.kernel_name}-#{Hardware::CPU.arch}". Each archive unpacks to
  # the same layout as a source build (bin/, etc/, share/, LICENSE), so the two
  # install paths below are equivalent.
  SHA256S = {
    "Darwin-arm64"  => "${DARWIN_ARM64_SHA256}",
    "Darwin-x86_64" => "${DARWIN_X86_64_SHA256}",
    "Linux-arm64"   => "${LINUX_ARM64_SHA256}",
    "Linux-x86_64"  => "${LINUX_X86_64_SHA256}",
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
    sha256 "${SOURCE_SHA256}"
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
EOF
