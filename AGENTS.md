# AGENTS.md

## About This Repository

This is a **chezmoi dotfiles repository** managing macOS configurations. All configuration is templated using Go templates and deployed via chezmoi.

## Build/Lint/Test Commands

### Chezmoi Commands

```bash
# View managed files
chezmoi managed

# Preview changes before applying
chezmoi diff

# Apply dotfiles to home directory
chezmoi apply

# Dry-run (show what would change)
chezmoi apply --dry-run

# Update from remote repository
chezmoi git pull

# Run a specific script manually
chezmoi run-script <script-name>

# Edit configuration
chezmoi edit
```

### Scripts Directory

Located in `.chezmoiscripts/`:

- `run_onchange_before_install-packages.sh.tmpl` - Installs Homebrew packages
- `run_onchange_after_setup-macos-defaults.sh.tmpl` - Sets macOS defaults
- `run_onchange_after_reload-keymap.sh.tmpl` - Reloads keymap
- `run_onchange_after_setup-*.sh.tmpl` - Language/tool setup scripts

### Shell Configuration

- Main config: `dot_zshrc.tmpl` (uses zsh4humans v5)
- Environment: `dot_zshenv.tmpl`
- Prompt/theme: `dot_p10k.zsh.tmpl`

### Language Support

Configurable languages in `.chezmoi.yaml.tmpl`:

- bash
- cpp (cmake, meson)
- go
- java (maven)
- javascript/node
- odin
- python (uv)
- rust
- zig

## Code Style Guidelines

### Templates (TOML/YAML/Go)

1. **File extension**: Use `.tmpl` suffix for all templates
2. **Conditional blocks**: Use `{{- if ... }}` with whitespace trimming (`{{-` / `-}}`)
3. **Variable naming**:
   - Top-level config: `app.<tool>`, `lang.<language>`, `ui.<setting>`
   - Variables: snake_case (e.g., `$catppuccin`, `$pragmata`)
4. **Default values**: Use `dig` with defaults: `{{ dig "section" "key" default_value . }}`
5. **Prompt questions**: Use `promptBoolOnce` or `promptStringOnce` for interactive setup
6. **Code organization**:
   - Headers: `################################################################################`
   - Sections: INPUT → UI → Apps → LANGS → Chezmoi

### Shell Scripts (Bash)

1. **Shebang**: `#!/usr/bin/env bash`
2. **Strict mode**: `set -euo pipefail` at top
3. **Use `brew bundle`** for package installation (see `run_onchange_before_install-packages.sh.tmpl`)
4. **Error handling**: Check commands with `hash` or `command -v`

### Naming Conventions

- **Files**: snake_case with `.tmpl` suffix
- **Variables**: snake_case (e.g., `$neovim`)
- **Config keys**: dot notation (e.g., `app.neovim`, `lang.python`)
- **Functions**: snake_case

### Error Handling

1. Check prerequisites before operations
2. Use `|| return` in templates for shell safety
3. Validate OS (currently macOS-only: `.chezmoi.yaml.tmpl:1`)
4. Use `brew bundle` with `--no-upgrade --quiet`

### Formatting

- **Indentation**: 2 spaces for TOML/config
- **Line length**: Prefer readability over strict limits
- **Ordering**:
  - Config sections in logical order (INPUT → UI → Apps → LANGS)
  - Alphabetical within categories where sensible
  - Comments with `#` for sections

## Additional Notes

1. **Always test changes** with `chezmoi diff` before `chezmoi apply`
2. **macOS-only**: Code assumes macOS (see `.chezmoi.yaml.tmpl:1`)
3. **XDG compliance**: Uses `~/.config` via `XDG_CONFIG_HOME`
4. **Homebrew**: Centralized package management via Brewfile
5. **Terminal apps**: ghostty/wezterm for terminal
6. **Editor**: neovim/vim (configurable via `tool.editor`)

