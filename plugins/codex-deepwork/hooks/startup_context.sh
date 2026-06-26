#!/usr/bin/env bash
set -euo pipefail

context="Codex DeepWork is installed. Use DeepWork MCP tools as the source of truth for workflow state. When starting a workflow in Codex, omit session_id unless the current tool instructions provide one. After start_workflow returns begin_step.session_id, pass that session_id to all later DeepWork calls."

if command -v jq >/dev/null 2>&1; then
  jq -n --arg ctx "$context" '{hookSpecificOutput: {hookEventName: "SessionStart", additionalContext: $ctx}}'
else
  printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":%s}}\n' "$(python3 -c 'import json,sys; print(json.dumps(sys.argv[1]))' "$context")"
fi
