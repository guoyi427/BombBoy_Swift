//
//  BBBoyView.swift
//  BombBoy_Swift
//
//  Created by guoyi on 16/4/25.
//  Copyright © 2016年 帅毅. All rights reserved.
//

import UIKit

class BBBoyView: BBBaseView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    init() {
        super.init(frame: CGRect(
            x: 0,
            y: 0,
            width: Size_Boy,
            height: Size_Boy))
        backgroundColor = UIColor.redColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK:公有方法
    func moveWithDirection(d: Int) {
        
    }
    
}
