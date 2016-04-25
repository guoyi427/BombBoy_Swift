//
//  BBGamePadView.swift
//  BombBoy_Swift
//
//  Created by guoyi on 16/4/25.
//  Copyright © 2016年 帅毅. All rights reserved.
//

import UIKit

class BBGamePadView: BBBaseView {

    let Width_HandShank: CGFloat = 30.0
    
    var _backgroundView: UIView = UIView()
    var _handShank: UIView = UIView()
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    init() {
        super.init(frame: CGRectMake(50, UIScreen.mainScreen().bounds.size.height - 150.0, 100, 100))
        _prepareBackgroundView()
        _prepareHandShankView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func _prepareBackgroundView() {
        _backgroundView.frame = bounds
        _backgroundView.backgroundColor = UIColor.cyanColor()
        _backgroundView.layer.cornerRadius = CGRectGetWidth(bounds) / 2.0
        _backgroundView.layer.masksToBounds = true;
        addSubview(_backgroundView)
    }
    
    func _prepareHandShankView() {
        _handShank.frame = CGRectMake((CGRectGetWidth(bounds) - Width_HandShank) / 2.0,
                                      (CGRectGetHeight(bounds) - Width_HandShank) / 2.0,
                                      Width_HandShank, Width_HandShank)
        _handShank.backgroundColor = UIColor.magentaColor()
        _handShank.layer.cornerRadius = Width_HandShank / 2.0
        _handShank.layer.masksToBounds = true
        addSubview(_handShank)
    }
    
    //MARK:Touch - Delegate
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        
    }

}
