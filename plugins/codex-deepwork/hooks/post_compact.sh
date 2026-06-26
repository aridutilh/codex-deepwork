#!/usr/bin/env bash
set -euo pipefail

input="$(cat)"
cwd="$(printf '%s' "$input" | python3 -c 'import json,sys; data=json.load(sys.stdin); print(data.get("cwd") or ".")' 2>/dev/null || printf '.')"

if ! command -v uvx >/dev/null 2>&1; then
  exit 0
fi

stack="$(uvx deepwork jobs get-stack --path "$cwd" 2>/dev/null || true)"

if [ -z "$stack" ]; then
  exit 0
fi

context="# Deepwork Context Restored

An active Deepwork workflow may exist in this project. Use the Deepwork MCP tools to continue it. Pass the restored session_id to finished_step, go_to_step, or abort_workflow.

\`\`\`text
$stack
\`\`\`"

if command -v jq >/dev/null 2>&1; then
  jq -n --arg ctx "$context" '{hookSpecificOutput: {hookEventName: "SessionStart", additionalContext: $ctx}}'
else
  printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":%s}}\n' "$(python3 -c 'import json,sys; print(json.dumps(sys.argv[1]))' "$context")"
fi
