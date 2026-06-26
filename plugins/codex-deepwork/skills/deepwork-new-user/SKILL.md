---
name: deepwork-new-user
description: Onboard a Codex user to DeepWork in a repo and verify that the MCP runtime is usable.
---

# DeepWork Onboarding For Codex

Use this when the user is new to DeepWork or asks how to use it from Codex.

## Steps

1. Check that `uvx` is available.
2. Call `get_workflows` if the DeepWork MCP server is available.
3. Explain the three core surfaces in plain language:
   - Workflows: repeatable multi-step jobs in `.deepwork/jobs`.
   - Reviews: repo-specific review rules and generated checks.
   - DeepSchemas: file-level expectations that can validate writes.
4. Show the user the workflows available in the current repo.
5. Offer one concrete first command, based on what exists in the repo.

## If MCP Is Not Available

Tell the user to install the plugin and restart Codex. Keep the fallback concise.
