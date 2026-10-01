RUST_DIR := rust

rust-version:
	@echo "Rust command-line utility versions:"
	rustc --version 			#rust compiler
	cargo --version 			#rust package manager
	rustfmt --version			#rust code formatter
	rustup --version			#rust toolchain manager
	clippy-driver --version		#rust linter

format:
	cargo fmt --manifest-path $(RUST_DIR)/Cargo.toml --quiet

lint:
	cargo clippy --manifest-path $(RUST_DIR)/Cargo.toml --quiet

test:
	cargo test --manifest-path $(RUST_DIR)/Cargo.toml --quiet

run:
	cargo run

release:
	cargo build --release

all: format lint test run
