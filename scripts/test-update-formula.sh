#!/usr/bin/env bash
set -euo pipefail

work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
mkdir -p "$work/Formula"
cp Formula/badger.rb Formula/statlite.rb "$work/Formula/"

h1=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
h2=bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
h3=cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
h4=dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd

FORMULA_ROOT="$work" ruby scripts/update-formula.rb badger v9.9.9 "$h1" "$h2" "$h3" "$h4"
grep -Fqx '  version "9.9.9"' "$work/Formula/badger.rb"
grep -Fq "sha256 \"$h1\"" "$work/Formula/badger.rb"
grep -Fq "sha256 \"$h2\"" "$work/Formula/badger.rb"
grep -Fq "sha256 \"$h3\"" "$work/Formula/badger.rb"
grep -Fq "sha256 \"$h4\"" "$work/Formula/badger.rb"

if FORMULA_ROOT="$work" ruby scripts/update-formula.rb badger v9.9.9 "$h1" "$h2" "$h3" "$h4"; then
  echo "already-current formula unexpectedly succeeded" >&2
  exit 1
fi

mkdir -p "$work/mismatch/Formula"
cp Formula/statlite.rb "$work/mismatch/Formula/"
ruby -e 'path = ARGV.fetch(0); text = File.read(path); text = text.sub("releases/download/v0.4.1", "download/v0.4.1"); File.write(path, text)' "$work/mismatch/Formula/statlite.rb"
if FORMULA_ROOT="$work/mismatch" ruby scripts/update-formula.rb statlite v9.9.8 "$h1" "$h2" "$h3" "$h4"; then
  echo "unrewritable Statlite URL unexpectedly succeeded" >&2
  exit 1
fi
grep -Fq 'download/v0.4.1/statlite_0.4.1_darwin_arm64.tar.gz' "$work/mismatch/Formula/statlite.rb"

FORMULA_ROOT="$work" ruby scripts/update-formula.rb statlite v9.9.8 "$h1" "$h2" "$h3" "$h4"
grep -Fq 'releases/download/v9.9.8/statlite_9.9.8_darwin_arm64.tar.gz' "$work/Formula/statlite.rb"
grep -Fq 'releases/download/v9.9.8/statlite_9.9.8_linux_amd64.tar.gz' "$work/Formula/statlite.rb"
grep -Fq "sha256 \"$h1\"" "$work/Formula/statlite.rb"
grep -Fq "sha256 \"$h4\"" "$work/Formula/statlite.rb"

if FORMULA_ROOT="$work" ruby scripts/update-formula.rb unknown v1.2.3 "$h1" "$h2" "$h3" "$h4"; then
  echo "unsupported formula unexpectedly succeeded" >&2
  exit 1
fi

if FORMULA_ROOT="$work" ruby scripts/update-formula.rb badger v1.2 "$h1" "$h2" "$h3" "$h4"; then
  echo "invalid version unexpectedly succeeded" >&2
  exit 1
fi

if FORMULA_ROOT="$work" ruby scripts/update-formula.rb badger v1.2.3 not-a-sha "$h2" "$h3" "$h4"; then
  echo "invalid checksum unexpectedly succeeded" >&2
  exit 1
fi

echo "formula updater tests passed"
