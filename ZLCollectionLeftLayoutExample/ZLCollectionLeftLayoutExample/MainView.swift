//
//  MainView.swift
//  ZLCollectionLeftLayoutExample
//
//  Created by harllan on 2023/9/8.
//

import UIKit


class MainView: UIView {
    private lazy var collectionView: UICollectionView = {
        let defaultLayout = ZLCollectionLeftLayout()
        defaultLayout.minimumLineSpacing = 10.0
        defaultLayout.minimumInteritemSpacing = 10.0
        defaultLayout.scrollDirection = .vertical
        defaultLayout.sectionInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 20.0, right: 10.0)
        let collectionView = UICollectionView(frame: bounds, collectionViewLayout: defaultLayout)
        collectionView.backgroundColor = .magenta
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }

    private func setupView() {
        backgroundColor = .cyan
        addSubview(collectionView)
        
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: "MainCellID")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension MainView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 300
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCellID", for: indexPath) as? MainCell else {
            return UICollectionViewCell()
        }
        cell.titleLabel.text = "\(indexPath.row)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let w = CGFloat.random(in: 20.0 ... 50.0)
        return CGSize(width: 30.0 + w, height: 25.0)
    }
}
