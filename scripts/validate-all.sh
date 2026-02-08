#!/usr/bin/env bash
set -euo pipefail

# Validate all Terraform roots under stacks/<cloud>
# - Runs terraform fmt (check-only) and terraform validate per stack
# - Runs terraform init with -backend=false so it won't touch remote state
# - Safe to run locally without credentials (as long as providers can be downloaded)

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

STACKS=(
  "stacks/aws"
  "stacks/gcp"
  "stacks/azure"
)

echo "Repo: ${REPO_ROOT}"
echo

for stack in "${STACKS[@]}"; do
  dir="${REPO_ROOT}/${stack}"
  echo "==> ${stack}"

  if [[ ! -d "${dir}" ]]; then
    echo "    SKIP (missing directory)"
    echo
    continue
  fi

  pushd "${dir}" >/dev/null

  echo "    terraform fmt -check -recursive"
  terraform fmt -recursive

  echo "    terraform init -backend=false -input=false"
  terraform init -backend=false -input=false >/dev/null

  echo "    terraform validate"
  terraform validate

  popd >/dev/null
  echo
done

echo "All stacks validated successfully."
