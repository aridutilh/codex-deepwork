# Contributing

Thanks for helping make Codex Deepwork useful.

This project is intentionally small. It should remain a Codex adapter around the upstream Deepwork runtime, not a competing runtime implementation.

## Principles

- Keep Deepwork MCP as the source of workflow truth.
- Keep repo-specific jobs in the target repo under `.deepwork/jobs`.
- Keep plugin code generic enough to work across projects.
- Credit upstream Deepwork when behavior is inspired by it.
- Avoid copying upstream implementation code.

## Good Contributions

- Better Codex skill instructions
- More reliable hook handling
- Clearer install docs
- Compatibility fixes for Codex plugin packaging
- Tests or validation scripts
- Examples showing how to use the plugin in real repos

## Review Checklist

Before opening a PR:

- Validate the plugin manifest.
- Check that no generated or local session files are committed.
- Confirm install instructions still work from a fresh checkout.
- Make sure docs distinguish this adapter from the upstream Deepwork project.
