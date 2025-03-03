#!/usr/bin/env bash

set -euo pipefail

echo "{%- set palette = flavor.colors %}
	--color=bg+:#{{palette.surface0.hex}}
	--color=bg:#{{palette.base.hex}}
	--color=fg+:#{{palette.text.hex}}
	--color=fg:#{{palette.text.hex}}
	--color=header:#{{palette.red.hex}}
	--color=hl+:#{{palette.red.hex}}
	--color=hl:#{{palette.red.hex}}
	--color=info:#{{palette.mauve.hex}}
	--color=marker:#{{palette.lavender.hex}}
	--color=pointer:#{{palette.rosewater.hex}}
	--color=prompt:#{{palette.mauve.hex}}
	--color=selected-bg:#{{palette.surface1.hex}}
	--color=spinner:#{{palette.rosewater.hex}}
" | /opt/homebrew/bin/whiskers - -f "${1}" | xargs echo
