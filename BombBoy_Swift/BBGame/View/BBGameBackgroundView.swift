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
    
    init(size: CGSize) {
        super.init(frame: CGRect(x: 0, y: 0, width: size.width * Size_Boy, height: size.height * Size_Boy))
        center = CGPoint(x: Width_Screen / 2.0, y: Height_Screen / 2.0)
        backgroundColor = UIColor.grayColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let path: UIBezierPath = UIBezierPath(roundedRect: CGRect(x: 100, y: 100, width: 500, height: 200),  cornerRadius: 10)
        UIColor.redColor().setStroke()
        path.lineWidth = 2
        path.stroke()
    }
    
    
}
