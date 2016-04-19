//
//  BBGameViewController.swift
//  BombBoy_Swift
//
//  Created by guoyi on 16/4/18.
//  Copyright © 2016年 帅毅. All rights reserved.
//

import UIKit

class BBGameViewController: BBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _prepareBackgroundView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Prepare
    
    func _prepareBackgroundView() {
        view.backgroundColor = UIColor.whiteColor()

        let gameBackgroundView: BBGameBackgroundView = BBGameBackgroundView(isTop: true);
        view.addSubview(gameBackgroundView);
    }

}
