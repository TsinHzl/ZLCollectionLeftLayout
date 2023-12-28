//
//  MainCell.swift
//  ZLCollectionLeftLayoutExample
//
//  Created by MacBook on 2023/9/8.
//

import UIKit

class MainCell: UICollectionViewCell {
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel(frame: bounds)
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    private func setupView() {
        contentView.backgroundColor = .lightText
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 6.0
        
        contentView.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.frame = bounds
    }
}
