#!/usr/bin/env bash
# ##############################################################################
# mapmycells_name_cleanup.sh
# Extracts and cleans a MapMyCells results ZIP, stripping comment lines from
# the bundled CSV.
#
# USAGE:
#   bash mapmycells_name_cleanup.sh <work_dir> <basename>
#
# ARGUMENTS:
#   work_dir   Directory containing the MapMyCells ZIP file
#              e.g. ./results/1_MapMyCells/
#   basename   Name stem for the ZIP and output files
#              e.g. seurat_integrated_mapmycells_log
#                   seurat_integrated_mapmycells_area
# ##############################################################################
set -euo pipefail

### Argument Validation ###

if [[ $# -ne 2 ]]; then
    echo "ERROR: Expected 2 arguments, got $#." >&2
    echo "USAGE: bash mapmycells_name_cleanup.sh <work_dir> <basename>" >&2
    exit 1
fi

work_dir="$1"
basename="$2"

if [[ ! -d "$work_dir" ]]; then
    echo "ERROR: work_dir does not exist: $work_dir" >&2
    exit 1
fi

### Check ZIP ###

zip_file=$(ls "${work_dir}/${basename}_"*.zip 2>/dev/null | head -n1)

if [[ -z "$zip_file" ]]; then
    echo "ERROR: No ZIP matching '${basename}_*.zip' found in: $work_dir" >&2
    exit 1
fi

### Extract ###

out_dir="${work_dir}/${basename}"
mkdir -p "$out_dir"

echo "Extracting: $zip_file -> $out_dir"
unzip -o "$zip_file" -d "$out_dir"

### Clean CSV ###

csv_file=$(ls "${out_dir}/${basename}_"*.csv 2>/dev/null | head -n1)

if [[ -z "$csv_file" ]]; then
    echo "ERROR: No CSV matching '${basename}_*.csv' found in: $out_dir" >&2
    exit 1
fi

renamed_csv="${out_dir}/${basename}.csv"
final_csv="${out_dir}/${basename}_final.csv"

echo "Renaming: $(basename "$csv_file") -> $(basename "$renamed_csv")"
mv "$csv_file" "$renamed_csv"

# The first fews rows of MMC results contain run metadata which is removed below
echo "Stripping metadata lines -> $(basename "$final_csv")"
sed '/^#/d' "$renamed_csv" > "$final_csv"

echo "Done"