#!/usr/bin/env bash
# Step 2 of 2: installs master-fibrous-sites, then asks about the optional extras.
# Usage: ./install.sh [--all] [--yes]
set -e
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
HERE="$(cd "$(dirname "$0")" && pwd)"
ALL=0; for a in "$@"; do [ "$a" = "--all" ] || [ "$a" = "--yes" ] && ALL=1; done
mkdir -p "$DEST"

ask() { [ "$ALL" = 1 ] && return 0; read -r -p "$1 [y/N] " r; [[ "$r" =~ ^[Yy] ]]; }
fetch() { # name repo
  tmp="$(mktemp -d)"; git clone -q --depth 1 "https://github.com/fibrousop07-dev/$2.git" "$tmp/r"
  if [ -d "$tmp/r/skills" ]; then cp -r "$tmp/r/skills/"* "$DEST/"; else cp -r "$tmp/r" "$DEST/$1" && rm -rf "$DEST/$1/.git"; fi
  rm -rf "$tmp"; echo "  installed $1"
}

cp -r "$HERE/skills/master-fibrous-sites" "$DEST/"
echo "Installed master-fibrous-sites into $DEST"

ask "Also install awesome-frontend-skills (GSAP, design polish, accessibility, router)?" && fetch awesome-frontend-skills awesome-frontend-skills
ask "Also install site-glow-up-skills (the post-build polish pass)?" && fetch site-glow-up site-glow-up-skills
echo "Done. Restart Claude Code, then run /master-fibrous-sites"
