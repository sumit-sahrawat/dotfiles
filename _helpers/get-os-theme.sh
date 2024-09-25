#!/usr/bin/env sh

{
  defaults read -g AppleInterfaceStyle 2>/dev/null || echo Light
} | tr '[:upper:]' '[:lower:]'
