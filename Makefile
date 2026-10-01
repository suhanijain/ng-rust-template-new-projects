RUST_DIR := rust
MANIFEST := $(RUST_DIR)/Cargo.toml

.PHONY: rust-version format format-check lint test run release build-release all

rust-version:
	@echo "Rust command-line utility versions:"
	rustc --version			# Rust compiler
	cargo --version			# Rust package manager
	rustfmt --version			# Rust code formatter
	rustup --version			# Rust toolchain manager
	clippy-driver --version		# Rust linter

format:
	cargo fmt --manifest-path $(MANIFEST) --quiet

format-check:
	cargo fmt --manifest-path $(MANIFEST) --check --quiet

lint:
	cargo clippy --manifest-path $(MANIFEST) --quiet

test:
	cargo test --manifest-path $(MANIFEST) --quiet

run:
	cargo run --manifest-path $(MANIFEST)

release:
	cargo build --manifest-path $(MANIFEST) --release

build-release: release

all: format lint test run
