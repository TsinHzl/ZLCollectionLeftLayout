# ZLCollectionLeftLayout

![Swift](https://img.shields.io/badge/Swift-5.0+-orange.svg)
![iOS](https://img.shields.io/badge/iOS-12.0+-blue.svg)
![CocoaPods](https://img.shields.io/cocoapods/v/ZLCollectionLeftLayout.svg)
![License](https://img.shields.io/github/license/TsinHzl/ZLCollectionLeftLayout.svg)

**专用于 UICollectionView 左对齐的 Layout。**

**[English](https://github.com/TsinHzl/ZLCollectionLeftLayout/blob/master/README.md)**

<img src="https://github.com/TsinHzl/ZLCollectionLeftLayout/assets/9133239/866ea316-b65a-4c38-a063-ca8bc5cb8429" width="300" />

---

- [环境要求](#环境要求)
- [安装](#安装)
- [实现原理](#实现原理)
- [基本用法](#基本用法)
- [进阶用法](#进阶用法)

---

## 环境要求

| | 最低版本 |
|---|---|
| iOS | 12.0+ |
| Swift | 5.0+ |
| Xcode | 14.0+ |

---

## 安装

### CocoaPods

```ruby
pod 'ZLCollectionLeftLayout'
# 或指定版本：
pod 'ZLCollectionLeftLayout', '~> 0.1.3'
```

### 手动集成

将 `ZLCollectionLeftLayout/ZLCollectionLeftAlignLayout.swift` 复制到项目中即可。

---

## 实现原理

`ZLCollectionLeftLayout` 继承 `UICollectionViewFlowLayout`，重写 `layoutAttributesForItem(at:)` 实现左对齐：

- 每行第一个 item 强制对齐到 `sectionInset.left`。
- 后续 item 通过将当前行矩形拉伸至全宽，与前一个 item 做相交判断：相交则追加在前一项右侧，否则换行从左起始。
- 计算结果缓存在字典（`calculatedAttrs`）中，`prepare()` 时清空，以空间换时间。
- **水平滚动方向不做修改** — 系统的 `UICollectionViewFlowLayout` 在水平方向已从左填充，无需额外处理。

---

## 基本用法

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

**必须**实现 `sizeForItemAt` —— 可变宽度正是左对齐布局的使用场景：

```swift
func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
    // 根据数据计算宽度（如文本宽度）
    return CGSize(width: calculatedWidth, height: 28)
}
```

---

## 进阶用法

`ZLCollectionLeftLayout` 完整支持 `UICollectionViewDelegateFlowLayout` 的 per-section 回调，可按 section 单独配置间距和边距：

```swift
// 按 section 设置 inset
func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    insetForSectionAt section: Int) -> UIEdgeInsets {
    return section == 0
        ? UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        : UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
}

// 按 section 设置 item 间距
func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return section == 0 ? 12 : 6
}
```

---

## 许可证

MIT。详见 [LICENSE](LICENSE)。
