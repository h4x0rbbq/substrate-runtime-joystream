#!/usr/bin/env bash
set -e

if cargo --version | grep -q "nightly"; then
	CARGO_CMD="cargo"
else
	CARGO_CMD="cargo +nightly"
fi

pushd wasm/

$CARGO_CMD build --target=wasm32-unknown-unknown --release


