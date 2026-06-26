---
name: deepwork-new-job
description: Create a new repeatable DeepWork job from Codex using the upstream new-job workflow.
---

# Create A DeepWork Job

Use this when the user wants to create a new repeatable workflow, job, playbook, or process for a repo.

## Process

1. Ask for missing essentials only when they cannot be inferred:
   - job name
   - trigger or use case
   - expected inputs
   - expected outputs
   - quality checks
2. Call `get_workflows`.
3. Prefer the upstream `deepwork_jobs/new_job` workflow when available.
4. Start it with `start_workflow`.
5. Follow each DeepWork step exactly.
6. Write job files only where the workflow instructs, normally under `.deepwork/jobs/<job_name>/`.
7. Call `finished_step` after each completed step.

## Job Design Rules

- Encode recurring judgement, not just a checklist.
- Make outputs concrete and file-oriented when possible.
- Include quality gates for the mistakes the team actually cares about.
- Keep project-specific voice, brand, compliance, and sequencing rules inside the job.
- Prefer small composable steps over one giant prompt.

## Codex Notes

When creating a job for Codex users, include instructions that account for Codex behavior:

- use MCP calls as workflow state
- keep `session_id` from `begin_step.session_id`
- resume after compaction from restored hook context
- avoid assuming Claude-only subagents or terminal affordances
