# ZLCollectionLeftLayout
**left aligned CollectionView layout**



#### Description

-  layout collection cell from left to right automatically
- when you set property **scrollDirection** to **.vertical**, it will automatically wrap
- when you set property **scrollDirection** to **.horizontal**, and you might have to set height of colletion view to show only one line



#### Install

##### cocoapods

- **pod 'ZLCollectionLeftLayout'**
- or specify a version:  **pod 'ZLCollectionLeftLayout', '~> 0.0.3'**

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

  



- screenshot
  ![20230908-114454](https://github.com/TsinHzl/ZLCollectionLeftAlignLayout/assets/9133239/549991a5-d521-4bf2-af28-47f4fb41a4ee)



