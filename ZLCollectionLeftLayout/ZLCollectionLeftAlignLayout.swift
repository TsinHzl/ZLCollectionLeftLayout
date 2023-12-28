//
//  ZLCollectionLeftLayout.swift
//
//  Created by harllan on 2023/8/10.
//

import UIKit


// MARK: - ZLCollectionLeftLayout
open class ZLCollectionLeftLayout: UICollectionViewFlowLayout {
    
    /// calculatedAttrs: used for storing calculated UICollectionViewLayoutAttributes to exchange space for time
    private lazy var calculatedAttrs = [IndexPath: UICollectionViewLayoutAttributes]()
    
    private var isHorizontal: Bool { scrollDirection == .horizontal }
    
    open override func prepare() {
        super.prepare()
        
        calculatedAttrs.removeAll()
    }
    
    
    open override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attrArr = super.layoutAttributesForElements(in: rect) else { return nil }
        
        var newAttrArr = attrArr
        
        for attributes in attrArr where attributes.representedElementKind == nil {
            if let index = newAttrArr.firstIndex(of: attributes) {
                newAttrArr[index] = layoutAttributesForItem(at: attributes.indexPath) ?? attributes
            }
        }
        
        return newAttrArr
    }
    
    /// main method for layout cell
    /// - Parameter indexPath: indexpath
    /// - Returns: layouted UICollectionViewLayoutAttributes
    open override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if let attr = calculatedAttrs[indexPath] { return attr }
        
        guard let curAttr = super.layoutAttributesForItem(at: indexPath) else { return nil }
        
        if isHorizontal {
            calculatedAttrs[indexPath] = curAttr
            return curAttr
        }
        
        let sectionInset = calculateSectionInsetForItem(at: indexPath.section)
        let layoutWidth = collectionView?.frame.width ?? 0 - sectionInset.left - sectionInset.right
        
        if indexPath.item == 0 {
            curAttr.frame.origin.x = sectionInset.left
            calculatedAttrs[indexPath] = curAttr
            return curAttr
        }
        
        let prevIP = IndexPath(item: indexPath.item - 1, section: indexPath.section)
        let prevRect = layoutAttributesForItem(at: prevIP)?.frame ?? .zero
        let prevRectRightPoint = prevRect.origin.x + prevRect.size.width
        let stretchedCurRect = CGRect(x: sectionInset.left,
                                      y: curAttr.frame.origin.y,
                                      width: layoutWidth,
                                      height: curAttr.frame.size.height)
        
        if !prevRect.intersects(stretchedCurRect) {
            curAttr.frame.origin.x = sectionInset.left
            calculatedAttrs[indexPath] = curAttr
            return curAttr
        }
        
        curAttr.frame.origin.x = prevRectRightPoint + calculateMinimumInteritemSpacingForSection(at: indexPath.section)
        calculatedAttrs[indexPath] = curAttr
        return curAttr
    }
    
    private func calculateMinimumInteritemSpacingForSection(at sectionIndex: Int) -> CGFloat {
        if let collectionView = collectionView,
           let delegate = collectionView.delegate as? UICollectionViewDelegateFlowLayout,
           delegate.responds(to: #selector(UICollectionViewDelegateFlowLayout.collectionView(_:layout:minimumInteritemSpacingForSectionAt:))) {
            
            return delegate.collectionView?(collectionView, layout: self, minimumInteritemSpacingForSectionAt: sectionIndex) ?? minimumInteritemSpacing
        }
        
        return minimumInteritemSpacing
    }
    
    private func calculateSectionInsetForItem(at index: Int) -> UIEdgeInsets {
        if let collectionView = collectionView,
           let delegate = collectionView.delegate as? UICollectionViewDelegateFlowLayout,
           delegate.responds(to: #selector(UICollectionViewDelegateFlowLayout.collectionView(_:layout:insetForSectionAt:))) {
            
            return delegate.collectionView?(collectionView, layout: self, insetForSectionAt: index) ?? sectionInset
        }
        
        return sectionInset
    }
}
