# PVRLabs Homebrew Tap

Homebrew formulas for PVRLabs projects.

This shared tap is the Homebrew home for current and future PVRLabs command-line tools. Formula archives download from each project's GitHub Releases.

## Install

```bash
brew install pvrlabs/tap/badger
```

StatLite will use this tap after its first public release:

```bash
brew install pvrlabs/tap/statlite
```

## Formula Ownership

Keep project formulas in `Formula/` in this repository. Do not create new one-project taps for future PVRLabs tools unless there is a concrete distribution reason.

## Deprecated Taps

`PVRLabs/homebrew-aibadger` is deprecated in favor of this shared tap. Existing users should switch from:

```bash
brew install pvrlabs/aibadger/badger
```

to:

```bash
brew install pvrlabs/tap/badger
```
