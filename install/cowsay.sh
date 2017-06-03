#!/bin/sh
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p "$DIR/cowsay"
cd "$DIR/cowsay"

wget http://http.debian.net/debian/pool/main/c/cowsay/cowsay_3.03+dfsg1-10.debian.tar.xz
wget http://http.debian.net/debian/pool/main/c/cowsay/cowsay_3.03+dfsg1.orig.tar.gz
tar -xf cowsay_3.03+dfsg1-10.debian.tar.xz
tar -xf cowsay_3.03+dfsg1.orig.tar.gz

cd "cowsay-3.03+dfsg1"
for line in $(cat ../debian/patches/series); do
        patch -p1 < ../debian/patches/$line
done

./install.sh "$HOME/.local"

rm -rf "$DIR/cowsay"
