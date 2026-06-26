---
name: deepwork-review
description: Run Deepwork reviews from Codex using .deepreview rules and DeepSchema-generated checks.
---

# Deepwork Reviews In Codex

Use this when the user asks for a Deepwork review, repo-specific review rules, or DeepSchema-backed validation.

## Process

1. Identify the changed files and current branch context.
2. Call the Deepwork review-instruction MCP tool if available.
3. Apply the returned rules narrowly to the changed files.
4. Report findings first, ordered by severity, with file and line references.
5. If the user asks you to fix issues, make focused changes and rerun the relevant review.

## Review Posture

- Prioritize concrete bugs, regressions, missing required artifacts, and violated repo rules.
- Do not rewrite for taste unless the configured review rules require it.
- If a dedicated reviewer subagent is unavailable in Codex, perform the review in the main thread with the same narrow scope.
