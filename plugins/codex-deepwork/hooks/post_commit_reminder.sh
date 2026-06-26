#!/usr/bin/env bash
set -euo pipefail

if ! command -v uvx >/dev/null 2>&1; then
  exit 0
fi

export DEEPWORK_HOOK_PLATFORM="${DEEPWORK_HOOK_PLATFORM:-claude}"
uvx deepwork hook post_commit_reminder
