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
        backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        
        let width_self: CGFloat = CGRectGetWidth(bounds)
        let height_self: CGFloat = CGRectGetHeight(bounds)
        
        let horizontal_count: Int = (Int)(height_self / Size_Boy)
        let vertocal_count: Int = (Int)(width_self / Size_Boy)
        
        //  水平条纹
        for i in 1 ... horizontal_count - 1 {
            let path: UIBezierPath = UIBezierPath()
            path.moveToPoint(CGPointMake(0, Size_Boy * CGFloat(i)))
            path.addLineToPoint(CGPointMake(width_self, Size_Boy * CGFloat(i)));
            
            UIColor.redColor().setStroke()
            path.lineWidth = 2
            path.stroke()
        }
        
        //  垂直条纹
        for i in 1 ... vertocal_count - 1 {
            let path: UIBezierPath = UIBezierPath()
            path.moveToPoint(CGPointMake(Size_Boy * CGFloat(i), 0))
            path.addLineToPoint(CGPointMake(Size_Boy * CGFloat(i), height_self));
            
            UIColor.redColor().setStroke()
            path.lineWidth = 2
            path.stroke()
        }
        
        
        
    }
    
    
}
