//
//  BBWallView.swift
//  BombBoy_Swift
//
//  Created by guoyi on 16/6/2.
//  Copyright © 2016年 帅毅. All rights reserved.
//

import UIKit

class BBWallView: BBBaseView {

    init(x: Int, y: Int, health: Int) {
        super.init(frame: CGRectMake(CGFloat(x) * Size_Boy, CGFloat(y) * Size_Boy, Size_Boy, Size_Boy))
        backgroundColor = UIColor.brownColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
