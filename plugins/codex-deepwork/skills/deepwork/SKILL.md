---
name: deepwork
description: Start, continue, inspect, or complete DeepWork workflows from Codex using the DeepWork MCP tools.
---

# DeepWork In Codex

Use the DeepWork MCP server as the source of truth for workflow execution. Do not freehand workflow state from files when MCP tools are available.

## Operating Loop

1. Call `get_workflows` to discover available workflows and jobs.
2. Choose the closest workflow from the user's request.
3. If several workflows fit equally well, ask one concise clarification.
4. Start the workflow with `start_workflow`.
   - In Codex, omit `session_id` when starting unless the current tool instructions explicitly provide one.
   - After starting, use the returned `begin_step.session_id` for every later DeepWork MCP call.
5. Follow the step instructions returned by DeepWork.
6. When a step output is ready, call `finished_step` with the required outputs and a short `work_summary`.
7. If DeepWork returns `needs_work`, fix the issues and call `finished_step` again.
8. If DeepWork returns `next_step`, continue with the new instructions.
9. If DeepWork returns `workflow_complete`, summarize outputs and any post-workflow instructions for the user.

## User Intent

- If the user names a workflow, start that workflow.
- If the user asks generally, inspect available workflows and infer the best fit.
- If the user asks what is available, list jobs and workflows with one-line summaries.
- If the user asks to create a workflow, use the `deepwork_jobs/new_job` workflow when available.
- If the user asks to improve a workflow from a completed run, use the `deepwork_jobs/learn` workflow when available.

## Safety

- Keep user work products in the project, not inside `.deepwork/tmp`.
- Do not bypass quality gates unless the user explicitly accepts the risk and the MCP call supports an override reason.
- If the workflow cannot continue, call `abort_workflow` with a clear explanation rather than leaving the state ambiguous.
