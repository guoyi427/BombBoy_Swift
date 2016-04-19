//
//  BBGameBackgroundView.swift
//  BombBoy_Swift
//
//  Created by guoyi on 16/4/18.
//  Copyright © 2016年 帅毅. All rights reserved.
//

import UIKit

class BBGameBackgroundView: BBBaseView {
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    init(name: String, age: String) {
        super.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        _prepareUI()
    }
    
    convenience init(isTop: Bool) {
    
        self.init(name:"123",age:"2")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func _prepareUI() {
        let a : CGFloat = Width_Screen
        print(a)
    }
    
    
}
