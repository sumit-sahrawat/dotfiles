# AGENTS.md

## Build/Lint/Test Commands

This is a **chezmoi dotfiles repository** managing macOS configurations.

### Chezmoi Commands

```bash
# View currentchezmoi configuration
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

Configurable languages in `.chezmoi.toml.tmpl`:

- bash
- cpp (cmake, meson)
- go
- javascript/node
- python (with uv)
- rust (with rustup)
- zig, odin, gleam, nasm
- haskell (ghcup), java (maven), ocaml, lua, scheme, sqlite

## Code Style Guidelines

### Templates (TOML/Go)

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
3. Validate OS (currently macOS-only: `.chezmoi.toml.tmpl:1`)
4. Use `brew bundle` with `--no-upgrade --quiet`

### Formatting

- **Indentation**: 2 spaces for TOML/config
- **Line length**: Prefer readability over strict limits
- **ordering**:
  - Config sections in logical order (INPUT → UI → Apps → LANGS)
  - Alphabetical within categories where sensible
  - Comments with `#` for sections

## Existing Rules (cursorrules/copilot-instructions)

No Cursor or Copilot rules found. Create `.cursor/rules/` or `.github/copilot-instructions.md` if needed.

## Additional Notes

1. **Always test changes** with `chezmoi diff` before `chezmoi apply`
2. **macOS-only**: Code assumes macOS (see `.chezmoi.toml.tmpl:2`)
3. **XDG compliance**: Uses `~/.config` via `XDG_CONFIG_HOME`
4. **Homebrew**: Centralized package management via Brewfile
5. **Terminal apps**: ghostty/wezterm for terminal
6. **Edit**: neovim/vim (configurable via `tool.editor`)
