//
//  BBBaseView.swift
//  BombBoy_Swift
//
//  Created by guoyi on 16/4/18.
//  Copyright © 2016年 帅毅. All rights reserved.
//

import UIKit

/// 炸弹男孩的宽和高
let Size_Boy: CGFloat = 50.0

class BBBaseView: UIView {
    internal let Width_Screen: CGFloat = UIScreen.mainScreen().bounds.size.width
    internal let Height_Screen: CGFloat = UIScreen.mainScreen().bounds.size.height
    
    var _speed: NSTimeInterval = 0.5

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
