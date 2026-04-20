#!/bin/bash
# Clears any stale git lock files left by the Claude sandbox, then pushes.
cd "$(dirname "$0")"
rm -f .git/HEAD.lock .git/index.lock .git/refs/remotes/origin/main.lock 2>/dev/null
git push
