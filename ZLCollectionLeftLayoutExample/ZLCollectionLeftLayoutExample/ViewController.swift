//
//  ViewController.swift
//  ZLCollectionLeftAlignLayoutExample
//
//  Created by harllan on 2023/9/8.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "main"
        
        let mainView = MainView(frame: view.bounds)
        
        view.addSubview(mainView)
    }


}

