---
name: deepwork-record
description: Record a workflow by doing it once, then turn the observed process into a repeatable DeepWork job.
---

# Record A Workflow

Use this when the user wants Codex to perform a process once and convert it into a reusable DeepWork job.

## Record Mode

1. Clarify the workflow name and final output.
2. Do the work normally, while noting:
   - decisions the user corrected
   - files read or written
   - quality checks that mattered
   - sequencing that should be preserved
   - project conventions that were easy to miss
3. After the run, summarize the observed process.
4. Ask whether to turn the observed process into a DeepWork job.
5. If yes, use the `deepwork_jobs/new_job` workflow when available.

## What To Capture

- The user's desired standard, not just the final artifact.
- The order of operations that reduced mistakes.
- Any examples that should become fixtures, references, or tests.
- Any "never do this" constraints.

## What Not To Capture

- One-off details that should not recur.
- Private credentials or secrets.
- Raw transcript/source material unless the job explicitly needs a fixture.
