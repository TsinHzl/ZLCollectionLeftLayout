# ZLCollectionLeftLayout
**专用于CollectionView左对齐的layout**

- 截图示例
![266536021-549991a5-d521-4bf2-af28-47f4fb41a4ee](https://github.com/TsinHzl/ZLCollectionLeftLayout/assets/9133239/866ea316-b65a-4c38-a063-ca8bc5cb8429)


- [Description](#Description)
- [Installation](#Installation)
- [Usage](#Usage)



#### Description

-  自动从左到右排列collection cell
-  当设置属性**scrollDirection**值为**.vertical**时，会自动换行
-  当设置属性**scrollDirection**值为**horizontal**时，最好设置collection view的高度成仅显示一行cell



#### Installation

##### cocoapods

- **pod 'ZLCollectionLeftLayout'**
- 或者指定一个版本:  **pod 'ZLCollectionLeftLayout', '~> 0.1.0**

##### 下载 framwork

- 下载仓库代码
- 然后添加 **ZLCollectionLeftLayout.swift** 文件到你的项目里即可

#### Usage

- 导入 ZLCollectionLeftAlignLayout

  - ```swift
    import ZLCollectionLeftLayout
    ```

- 设置collection view的**collectionViewLayout**为ZLCollectionLeftLayout的一个实例对象

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

- 实现下面方法: 

  - ```swift
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { 
      let w = CGFloat.random(in: 20.0 ... 50.0)
      return CGSize(width: 30.0 + w, height: 25.0)
    }
    ```



