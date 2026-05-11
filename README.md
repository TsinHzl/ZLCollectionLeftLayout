# ZLCollectionLeftLayout

![Swift](https://img.shields.io/badge/Swift-5.0+-orange.svg)
![iOS](https://img.shields.io/badge/iOS-12.0+-blue.svg)
![CocoaPods](https://img.shields.io/cocoapods/v/ZLCollectionLeftLayout.svg)
![License](https://img.shields.io/github/license/TsinHzl/ZLCollectionLeftLayout.svg)

**Left-aligned `UICollectionView` layout for iOS.**

**[中文版](https://github.com/TsinHzl/ZLCollectionLeftLayout/blob/master/README-zh.md)**

<img src="https://github.com/TsinHzl/ZLCollectionLeftLayout/assets/9133239/866ea316-b65a-4c38-a063-ca8bc5cb8429" width="300" />

---

- [Requirements](#requirements)
- [Installation](#installation)
- [How It Works](#how-it-works)
- [Usage](#usage)
- [Advanced Usage](#advanced-usage)

---

## Requirements

| | Minimum |
|---|---|
| iOS | 12.0+ |
| Swift | 5.0+ |
| Xcode | 14.0+ |

---

## Installation

### CocoaPods

```ruby
pod 'ZLCollectionLeftLayout'
# or pin a version:
pod 'ZLCollectionLeftLayout', '~> 0.1.3'
```

### Manual

Copy `ZLCollectionLeftLayout/ZLCollectionLeftAlignLayout.swift` into your project.

---

## How It Works

`ZLCollectionLeftLayout` subclasses `UICollectionViewFlowLayout` and overrides `layoutAttributesForItem(at:)` to left-align cells:

- The first item in each row is pinned to `sectionInset.left`.
- Subsequent items check whether the previous item shares the same row (via a full-width intersection test). If yes, the item is placed immediately to the right of its predecessor. If no, it starts a new row from the left.
- Computed frames are cached in a dictionary (`calculatedAttrs`) and cleared on each `prepare()` call.
- **Horizontal scroll direction is unchanged** — `UICollectionViewFlowLayout` already fills from left to right in that mode.

---

## Usage

### Basic Setup

```swift
import ZLCollectionLeftLayout

private lazy var collectionView: UICollectionView = {
    let layout = ZLCollectionLeftLayout()
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)

    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .systemBackground
    return cv
}()
```

You **must** implement `sizeForItemAt` — variable widths are what makes left-alignment meaningful:

```swift
func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
    // calculate width from your data (e.g. text size)
    return CGSize(width: calculatedWidth, height: 28)
}
```

---

## Advanced Usage

`ZLCollectionLeftLayout` fully respects `UICollectionViewDelegateFlowLayout` callbacks, so you can configure spacing and insets per section:

```swift
// Per-section insets
func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    insetForSectionAt section: Int) -> UIEdgeInsets {
    return section == 0
        ? UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        : UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
}

// Per-section interitem spacing
func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return section == 0 ? 12 : 6
}
```

---

## License

MIT. See [LICENSE](LICENSE).
