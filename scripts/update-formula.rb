#!/usr/bin/env ruby

# Update one of the explicitly supported PVR Labs formulae from a published
# release. The optional FORMULA_ROOT is used by the local integration test.

SUPPORTED_FORMULAS = %w[badger statlite].freeze

EXPECTED_PLATFORMS = [
  ["darwin", "arm64"],
  ["darwin", "amd64"],
  ["linux", "arm64"],
  ["linux", "amd64"],
].freeze

def fail!(message)
  warn message
  exit 1
end

formula, version, *hash_values = ARGV
unless formula && version && hash_values.length == EXPECTED_PLATFORMS.length
  fail!("usage: #{File.basename($PROGRAM_NAME)} <badger|statlite> <vX.Y.Z> <darwin_arm64_sha256> <darwin_amd64_sha256> <linux_arm64_sha256> <linux_amd64_sha256>")
end

fail!("unsupported formula: #{formula}") unless SUPPORTED_FORMULAS.include?(formula)
fail!("version must match vX.Y.Z: #{version}") unless version.match?(/\Av\d+\.\d+\.\d+\z/)

hashes = EXPECTED_PLATFORMS.zip(hash_values).to_h
hashes.each do |platform, value|
  fail!("invalid SHA-256 for #{platform.join("_")}") unless value.match?(/\A[0-9a-fA-F]{64}\z/)
end

root = ENV.fetch("FORMULA_ROOT", File.expand_path("..", __dir__))
path = File.join(root, "Formula", "#{formula}.rb")
fail!("formula file does not exist: #{path}") unless File.file?(path)

plain_version = version.delete_prefix("v")
text = File.read(path)

if formula == "badger"
  version_lines = text.lines.grep(/^  version "[^"]+"$/)
  fail!("expected exactly one Badger version line") unless version_lines.length == 1

  text = text.sub(/^  version "[^"]+"$/) { %(  version "#{plain_version}") }
end

seen = Hash.new(0)
current_platform = nil
updated_lines = text.lines.map do |line|
  url_match = line.match(/url ".*#{formula}_.*_(darwin|linux)_(arm64|amd64)\.tar\.gz"/)
  if url_match
    current_platform = [url_match[1], url_match[2]]
    seen[current_platform] += 1

    if formula == "statlite"
      original_line = line
      line = line.sub(%r{releases/download/v\d+\.\d+\.\d+/statlite_\d+\.\d+\.\d+_(darwin|linux)_(arm64|amd64)\.tar\.gz}) do
        "releases/download/#{version}/statlite_#{plain_version}_#{Regexp.last_match(1)}_#{Regexp.last_match(2)}.tar.gz"
      end
      expected_url = "releases/download/#{version}/statlite_#{plain_version}_#{current_platform.join("_")}.tar.gz"
      fail!("could not rewrite Statlite URL for #{current_platform.join("_")}") unless line != original_line && line.include?(expected_url)
    end
  elsif current_platform && line.match?(/^\s*sha256 "[^"]+"/)
    hash = hashes.fetch(current_platform) { fail!("unexpected formula platform: #{current_platform.join("_")}") }
    line = line.sub(/^\s*sha256 "[^"]+"/) do |entry|
      "#{entry[/^\s*sha256 /]}\"#{hash}\""
    end
    current_platform = nil
  end
  line
end

missing = EXPECTED_PLATFORMS.reject { |platform| seen[platform] == 1 }
duplicates = EXPECTED_PLATFORMS.select { |platform| seen[platform] > 1 }
fail!("formula platform mapping is incomplete: #{missing.map { |p| p.join("_") }.join(", ")}") unless missing.empty?
fail!("formula platform mapping is duplicated: #{duplicates.map { |p| p.join("_") }.join(", ")}") unless duplicates.empty?
fail!("formula update produced no change") if updated_lines.join == File.read(path)

File.write(path, updated_lines.join)
puts "updated Formula/#{formula}.rb to #{version}"
