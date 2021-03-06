#!/usr/bin/env bash
set -e

if cargo --version | grep -q "nightly"; then
	CARGO_CMD="cargo"
else
	CARGO_CMD="cargo +nightly"
fi

pushd wasm/

$CARGO_CMD build --target=wasm32-unknown-unknown --release

for i in joystream_node_runtime_wasm
do
	wasm-gc target/wasm32-unknown-unknown/release/$i.wasm target/wasm32-unknown-unknown/release/$i.compact.wasm
done

mkdir -p /home/travis/substrate-node-joystream/substrate-runtime-joystream/is_built
