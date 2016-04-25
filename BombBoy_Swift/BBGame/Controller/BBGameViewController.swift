//
//  BBGameViewController.swift
//  BombBoy_Swift
//
//  Created by guoyi on 16/4/18.
//  Copyright © 2016年 帅毅. All rights reserved.
//

import UIKit

class BBGameViewController: BBBaseViewController {

    var _gameBackgroundView: BBGameBackgroundView = BBGameBackgroundView(size: CGSize(width: 49, height: 29));
    var _boyView: BBBoyView = BBBoyView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _prepareBackgroundView()
        _prepareBoyView()
        _prepareGamePadView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Prepare
    
    func _prepareBackgroundView() {
        view.backgroundColor = UIColor.whiteColor()

        view.addSubview(_gameBackgroundView)
    }
    
    func _prepareBoyView() {
        _boyView.center = CGPointMake(CGRectGetWidth(_gameBackgroundView.frame) / 2.0, CGRectGetHeight(_gameBackgroundView.frame) / 2.0)
        _gameBackgroundView.addSubview(_boyView)
    }
    
    func _prepareGamePadView() {
        let gamePad: BBGamePadView = BBGamePadView()
        view.addSubview(gamePad)
    }

}
