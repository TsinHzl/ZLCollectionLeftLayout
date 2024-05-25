# ZLCollectionLeftLayout
**left aligned CollectionView layout**

- screenshot
![266536021-549991a5-d521-4bf2-af28-47f4fb41a4ee](https://github.com/TsinHzl/ZLCollectionLeftLayout/assets/9133239/866ea316-b65a-4c38-a063-ca8bc5cb8429)


**[中文版](https://github.com/TsinHzl/ZLCollectionLeftLayout/blob/master/README-zh.md)**



- [Description](#Description)
- [Installation](#Installation)
- [Usage](#Usage)



#### Description

-  layout collection cell from left to right automatically
- when you set property **scrollDirection** to **.vertical**, it will automatically wrap
- when you set property **scrollDirection** to **.horizontal**, and you might have to set height of colletion view to show only one line



#### Installation

##### cocoapods

- **pod 'ZLCollectionLeftLayout'**
- or specify a version:  **pod 'ZLCollectionLeftLayout', '~> 0.1.2'**

##### download framwork

- download the repo.
- and add **ZLCollectionLeftLayout.swift** to your project

#### Usage

- import ZLCollectionLeftAlignLayout

  - ```swift
    import ZLCollectionLeftLayout
    ```

- set collectionViewLayout of collection view to a instance of ZLCollectionLeftLayout

  - ```swift
    private lazy var collectionView: UICollectionView = {
      // instance ZLCollectionLeftLayout
      let defaultLayout = ZLCollectionLeftLayout()
      defaultLayout.minimumLineSpacing = 10.0
      defaultLayout.minimumInteritemSpacing = 10.0
      defaultLayout.scrollDirection = .vertical
      defaultLayout.sectionInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 20.0, right: 10.0)
      // set collectionViewLayout to a instance of ZLCollectionLeftLayout
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: defaultLayout)
      collectionView.backgroundColor = .magenta
      collectionView.showsVerticalScrollIndicator = false
      return collectionView
    }()
    ```

- impletation the method: 

  - ```swift
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { 
      let w = CGFloat.random(in: 20.0 ... 50.0)
      return CGSize(width: 30.0 + w, height: 25.0)
    }
    ```



