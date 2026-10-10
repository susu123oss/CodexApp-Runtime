# Codex Runtime

CodexApp iOS/TrollStore runtime release inputs.

- `package-version.txt` is the package revision exposed to CodexApp.
- `packaging-ref.txt` pins the owngoal-dev/codex packaging repository.
- `0005-ios-native-posix-spawn.patch` extends Codex's existing Apple native `posix_spawn` backend to iOS so unified exec does not fall back to `fork`/`pre_exec` on pure TrollStore.

Published releases use tags like `runtime-codex-v0.162.1-1` and include the rootless `iphoneos-arm64` deb plus `SHA256SUMS`.
