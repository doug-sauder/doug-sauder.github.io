#!/usr/bin/env bash
set -euo pipefail

# Resolve paths from the repository root so the script can be run from anywhere.
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source_markdown="${script_dir}/profile.md"
metadata_file="${script_dir}/profile-meta.yaml"
template_file="${script_dir}/profile-template.html"
output_file="${script_dir}/docs/index.html"

# Generate the public profile page from the Pandoc Markdown source and metadata.
pandoc "${source_markdown}" \
  --metadata-file="${metadata_file}" \
  --template="${template_file}" \
  --standalone \
  --from=markdown+fenced_divs+header_attributes \
  --to=html5 \
  --section-divs=false \
  --output="${output_file}"

echo "Generated ${output_file}"
