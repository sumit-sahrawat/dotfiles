# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Chezmoi dotfiles repository for macOS. All configuration is templated with Go templates and deployed via chezmoi. macOS-only (enforced in `.chezmoi.yaml.tmpl:1`).

## Commands

```bash
chezmoi diff              # Preview changes (always do this before apply)
chezmoi apply             # Deploy dotfiles to home directory
chezmoi apply --dry-run   # Dry-run
chezmoi managed           # List managed files
chezmoi git pull          # Update from remote
```

## Architecture

### Template Data Model (`.chezmoi.yaml.tmpl`)

Configuration is opt-in via boolean flags set interactively with `promptBoolOnce`/`promptStringOnce`. Key namespaces:

- `input.*` — keyboard/mouse settings (caps2ctrl, repeat rates)
- `ui.*` — theme (catppuccin flavor), night shift, dock
- `app.<tool>` — per-app enable flags (ghostty, neovim, claude_code, etc.)
- `lang.<language>` — per-language enable flags (cpp, java, python, rust, etc.)
- `tool.*` — editor/merge tool selection
- `git.*` — multi-identity SSH config (codeberg, github, isolated dirs)
- `claude_code.*` — claude-code settings.json (passed through as-is via `toPrettyJson`)
- `llama.*` — llama.cpp server config (port, idle_timeout, models)
- `terminal.font.*` — font family/size, PragmataPro conditional

### Conditional File Management

- Directories prefixed with `remove_` (e.g., `remove_dot_config/`) use chezmoi's remove-on-false pattern — files are removed from the target when their template condition is false.
- `.chezmoiexternal.toml.tmpl` pulls git repos (catppuccin themes, tools) and archives conditionally based on template data.

### Scripts (`.chezmoiscripts/`)

All scripts are `run_onchange_*` — idempotent, re-triggered by content hash changes:
- `before_install-packages` — `brew bundle` with inline Brewfile (conditional sections per app/lang)
- `after_setup-macos-defaults` — system defaults
- `after_reload-keymap` — hidutil keyboard remapping
- `after_setup-{bat,llama}` — tool-specific post-install

### Custom CLI Tools (`remove_dot_local/remove_bin/`)

- `:repos` — multi-repo git operations (sync, fetch, status, clone, branch, checkout)
- `:llama` — llama.cpp model management (pull, load, unload, ps, restart)
- `fzf` — wrapper that filters color/bind args for consistency

### Shell Stack

zsh4humans v5 (`dot_zshrc.tmpl`) → Powerlevel10k (`dot_p10k.zsh.tmpl`), with Ghostty shell integration detection.

## Code Style

- **Templates**: `.tmpl` suffix, whitespace-trimmed delimiters (`{{-` / `-}}`), `dig` for safe nested lookups with defaults
- **Variables**: snake_case; config keys use dot notation (`app.neovim`, `lang.python`)
- **Section headers**: `################################################################################`, ordered INPUT → UI → Apps → LANGS → Chezmoi
- **Shell scripts**: `#!/usr/bin/env bash`, `set -euo pipefail`, check tools with `hash`/`command -v`
- **Indentation**: 2 spaces for TOML/config files
- **Packages**: add to the inline Brewfile in `run_onchange_before_install-packages.sh.tmpl`, never install manually
