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
URL="https://github.com/bufbuild/buf/archive/v${VERSION}.tar.gz"
SHA256=$(curl -sSL "${URL}" | sha256 | cut -f 1 -d ' ')

rm -rf Formula
mkdir -p Formula
cat <<EOF >Formula/buf.rb
class Buf < Formula
  desc "A new way of working with Protocol Buffers."
  homepage "https://buf.build"
  head "https://github.com/bufbuild/buf.git"
  url "${URL}"
  sha256 "${SHA256}"
  version "${VERSION}"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = HOMEBREW_CACHE/"go_cache"
    system "sh", "make/buf/scripts/brew.sh", ".build/brew"
    prefix.install Dir[".build/brew/*"]
  end

  test do
    system "#{bin}/buf --version"
  end
end
EOF
