#!/usr/bin/env bash
set -euo pipefail

repo_url="https://github.com/CercaTrovato/wuhan-donghu-thesis-revision.git"
branch="main"
skill_name="wuhan-donghu-thesis-revision"
target="${WDU_THESIS_REVISION_TARGET:-codex}"

case "$target" in
  codex)
    skill_root="$HOME/.agents/skills"
    ;;
  claude)
    skill_root="$HOME/.claude/skills"
    ;;
  *)
    echo "Unsupported WDU_THESIS_REVISION_TARGET '$target'. Use 'codex' or 'claude'." >&2
    exit 1
    ;;
esac

if [ -n "${WDU_THESIS_REVISION_SKILL_ROOT:-}" ]; then
  skill_root="$WDU_THESIS_REVISION_SKILL_ROOT"
fi

if ! command -v git >/dev/null 2>&1; then
  echo "git is required. Install Git first, then rerun this installer." >&2
  exit 1
fi

mkdir -p "$skill_root"
dest="$skill_root/$skill_name"

if [ -d "$dest/.git" ]; then
  git -C "$dest" pull --ff-only origin "$branch"
else
  if [ -e "$dest" ]; then
    stamp="$(date +%Y%m%d_%H%M%S)"
    backup="$dest.backup_$stamp"
    mv "$dest" "$backup"
    echo "Existing non-Git skill directory moved to: $backup"
  fi
  git clone --depth 1 --branch "$branch" "$repo_url" "$dest"
fi

echo "wuhan-donghu-thesis-revision installed for $target:"
echo "$dest"
echo "Restart your agent app so the skill list refreshes."
