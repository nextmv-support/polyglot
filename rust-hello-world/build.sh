#!/bin/bash

set -euo pipefail

cross build -r --target aarch64-unknown-linux-gnu
cp target/aarch64-unknown-linux-gnu/release/rust-echo ./main
