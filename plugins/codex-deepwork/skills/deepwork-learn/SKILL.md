---
name: deepwork-learn
description: Improve an existing Deepwork job after a completed or corrected run.
---

# Learn From A Workflow Run

Use this when the user says a workflow should learn from feedback, improve a job, update quality gates, or preserve a correction for next time.

## Process

1. Identify the completed workflow or job to improve.
2. Gather the user's correction, rejected output, accepted output, and any changed files.
3. Call `get_workflows`.
4. Prefer the upstream `deepwork_jobs/learn` workflow when available.
5. Start the workflow and follow its steps.
6. Keep updates focused on repeatable lessons, not one-off episode details unless the job is episode-specific.

## Good Learning Examples

- "Never use placeholder X handles in launch posts."
- "Start YouTube timestamps at the first substantive chapter, not 00:00."
- "For this brand, avoid framings that make solo founding sound gated."
- "Use the guest's real product spelling when ASR garbles it."

## Bad Learning Examples

- "This one guest prefers a shorter bio" unless that guest recurs.
- "The transcript file was in Downloads today."
- "The user was tired of seeing option three."
