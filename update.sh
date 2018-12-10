#!/usr/bin/env bash
set -x
set -e

# NOTE: Last executed using Rust 1.31.0

cargo install --force --version 0.14.0 svd2rust

rustup component add rustfmt-preview
cargo install --force --version 0.4.0 form

rm -rf src
mkdir src
svd2rust -i ./nrf52832.svd
form -i lib.rs -o src
rm lib.rs
cargo fmt
rustfmt build.rs
