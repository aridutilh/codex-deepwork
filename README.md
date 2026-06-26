# Codex DeepWork

Codex DeepWork is an open-source Codex plugin that brings DeepWork-style structured workflows to Codex.

It is designed for teams that want repeatable, quality-gated project workflows in Codex: create jobs, run jobs, record new workflows, learn from completed runs, and apply review or schema checks inside the current repository.

## Status

This project is an early adapter prototype.

It does not reimplement the DeepWork runtime. Instead, it packages Codex skills, hooks, and MCP configuration around the existing `deepwork` MCP server.

## Credit

This project is inspired by and built to interoperate with [DeepWork](https://www.deepwork.md/) by Unsupervised, including the [Unsupervisedcom/deepwork](https://github.com/Unsupervisedcom/deepwork) plugin and workflow runtime originally built for Claude Code.

DeepWork is a separate project with its own license. This repository provides a Codex-native adapter and does not copy or vendor the DeepWork runtime.

## Why This Exists

Codex can handle a one-off prompt well. For example, you can give Codex a podcast transcript and ask it to draft launch content.

That is different from a repeatable DeepWork job.

A DeepWork job can encode:

- a required sequence of steps
- persistent workflow state
- expected inputs and outputs
- repo-specific house rules
- quality gates before moving on
- review and schema checks
- lessons learned from previous runs

For a recurring workflow like podcast launch content, that means the production system can remember details like:

- which account posts first
- how X posts should be line-broken
- which platform links are canonical
- which transcript garbles need correction
- which brand framings should be avoided
- what files must exist before launch day content is complete

The goal is to turn "please remember all of this" into an installable Codex tool.

## Install

From a checkout of this repository:

```bash
codex plugin marketplace add /path/to/codex-deepwork
codex plugin add codex-deepwork@codex-deepwork
```

Then restart Codex or open a new thread.

## Use In A Project

After installation, open Codex in any repository that has DeepWork jobs, such as:

```text
your-project/
  .deepwork/
    jobs/
      example_job/
```

Then ask Codex:

```text
Use DeepWork to show me available workflows.
```

or:

```text
Create a new DeepWork job for our weekly content launch workflow.
```

or:

```text
Run the episode content machine workflow.
```

The plugin lives outside the target repo. The jobs and generated work products live inside the target repo.

## What The Plugin Adds

- `deepwork`: start, continue, inspect, and complete workflows
- `deepwork-new-user`: onboard a Codex user to a repo's DeepWork setup
- `deepwork-new-job`: create a new repeatable workflow
- `deepwork-record`: do a process once and convert it into a job
- `deepwork-learn`: improve a job after a completed or corrected run
- `deepwork-review`: run DeepWork review and schema checks

It also bundles lifecycle hooks for:

- restoring workflow context after compaction
- reminding agents about post-commit reviews
- invoking DeepSchema write checks when files change

## Requirements

- Codex with plugin support
- `uvx` available on `PATH`
- the upstream `deepwork` package installable through `uvx`
- a Git repository for project workflows

## Compatibility Note

The bundled MCP config currently starts the upstream DeepWork server with:

```bash
uvx deepwork serve --platform claude
```

That flag is intentional for now. The current upstream DeepWork runtime has Claude-oriented review and hook formatting. Codex still talks to the server through MCP; the flag is a compatibility shim, not a Claude Code dependency.

## Repository Layout

```text
codex-deepwork/
  .agents/plugins/marketplace.json
  plugins/codex-deepwork/
    .codex-plugin/plugin.json
    .mcp.json
    hooks/
    skills/
  docs/
```

## Development

Validate the plugin manifest:

```bash
PYTHONPATH=/private/tmp/plugin-validator-deps python3 ~/.codex/skills/.system/plugin-creator/scripts/validate_plugin.py plugins/codex-deepwork
```

If you edit the plugin while it is installed locally, reinstall it into a fresh Codex thread so the updated skills and hooks are picked up.

## License

MIT. See [LICENSE](./LICENSE).
