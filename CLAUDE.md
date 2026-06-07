# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ZLCollectionLeftLayout — a single-file Swift library providing left-aligned `UICollectionView` layout. Distributed via CocoaPods (v0.1.3). iOS 12.0+, Swift 5.0+.

## Build & Test

```bash
# Build example project
xcodebuild -project ZLCollectionLeftLayoutExample/ZLCollectionLeftLayoutExample.xcodeproj \
  -scheme ZLCollectionLeftLayoutExample \
  -destination 'platform=iOS Simulator,name=iPhone 16' \
  build

# Run tests
xcodebuild -project ZLCollectionLeftLayoutExample/ZLCollectionLeftLayoutExample.xcodeproj \
  -scheme ZLCollectionLeftLayoutExample \
  -destination 'platform=iOS Simulator,name=iPhone 16' \
  test

# Validate podspec
pod spec lint ZLCollectionLeftLayout.podspec --allow-warnings
```

## Architecture

The entire library is a single file:

- `ZLCollectionLeftLayout/ZLCollectionLeftAlignLayout.swift` — `ZLCollectionLeftLayout` subclasses `UICollectionViewFlowLayout`, overrides `layoutAttributesForItem(at:)` to left-align cells. Uses a `[IndexPath: UICollectionViewLayoutAttributes]` cache (`calculatedAttrs`) cleared on each `prepare()`. Respects `UICollectionViewDelegateFlowLayout` callbacks for per-section insets and interitem spacing. Horizontal scroll direction passes through unchanged.

- `ZLCollectionLeftLayoutExample/` — Xcode project demonstrating usage with random-width cells.

## CocoaPods Release

1. Bump `spec.version` in `ZLCollectionLeftLayout.podspec`
2. Tag: `git tag <version> && git push origin <version>`
3. `pod trunk push ZLCollectionLeftLayout.podspec`
