#!/usr/bin/env bash

set -e

CONFIG="scripts/install.conf.yaml"
DOTBOT_DIR="dotbot"

DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTBOT_PATH="${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}"

DOTBOT_FLAGS=()
if [[ "${GITHUB_ACTIONS:-}" != "true" ]]; then
  DOTBOT_FLAGS+=("--quiet")
fi

cd "${BASEDIR}"
git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
git submodule update --init --recursive "${DOTBOT_DIR}"

"$DOTBOT_PATH" "${DOTBOT_FLAGS[@]}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"
