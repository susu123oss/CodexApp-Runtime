# Manual-only check of the pinned 0.162.1 iOS native child/posix_spawn patch.
# No upstream fetch, no CLI release, no modification to stable packaged binaries.
ROOT := $(CURDIR)
export PATH := $(ROOT)/.cache/rust-toolchain/bin:$(PATH)
export RUSTC := $(ROOT)/.cache/rust-toolchain/bin/rustc
export CARGO_HOME := $(ROOT)/.cache/codex-ios-runtime-src/build/ios-arm64/cargo-home
export CARGO_TARGET_DIR := $(ROOT)/.cache/codex-ios-runtime-src/build/ios-arm64/target-release-online
export SDKROOT := $(shell xcrun --sdk iphoneos --show-sdk-path)
export IPHONEOS_DEPLOYMENT_TARGET := 15.0
export PKG_CONFIG_ALLOW_CROSS := 1

.PHONY: pty-ios cli-ios
pty-ios:
	cd "$(ROOT)/.cache/codex-0.162.1-exact/codex-rs" && "$(ROOT)/.cache/rust-toolchain/bin/cargo" build --offline --release --target aarch64-apple-ios --package codex-utils-pty

# Manual-only validation candidate. Uses the pinned source and existing
# release artifacts; does not sign or publish a DEB or modify any TIPA.
cli-ios:
	cd "$(ROOT)/.cache/codex-0.162.1-exact/codex-rs" && "$(ROOT)/.cache/rust-toolchain/bin/cargo" build --offline --release --target aarch64-apple-ios --package codex-cli --bin codex
