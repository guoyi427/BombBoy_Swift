//
//  BBGamePadView.swift
//  BombBoy_Swift
//
//  Created by guoyi on 16/4/25.
//  Copyright © 2016年 帅毅. All rights reserved.
//

import UIKit

enum BBGamePadDirection: NSInteger {
    case BBGamePadDirectionCenter
    case BBGamePadDirectionLeft
    case BBGamePadDirectionRight
    case BBGamePadDirectionTop
    case BBGamePadDirectionBottom
}

protocol BBGamePadViewDelegate: class {
    func gamePadViewDidMove(sender: BBGamePadView, direction: BBGamePadDirection)
}

class BBGamePadView: BBBaseView {

    let Size_HandShank: CGFloat = 50.0
    let Size_BackgroundView: CGFloat = 150.0
    
    var _backgroundView: UIView = UIView()
    var _handShank: UIView = UIView()
    
    weak var gamePadDelegate: BBGamePadViewDelegate?

    
    init() {
        super.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width / 2.0, UIScreen.mainScreen().bounds.height))
        _prepareBackgroundView()
        _prepareHandShankView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func _prepareBackgroundView() {
        _backgroundView.frame = CGRectMake(0, 0, Size_BackgroundView, Size_BackgroundView)
        _backgroundView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.8)
        _backgroundView.layer.cornerRadius = Size_BackgroundView / 2.0
        _backgroundView.layer.masksToBounds = true;
        addSubview(_backgroundView)
        _backgroundView.hidden = true
    }
    
    func _prepareHandShankView() {
        _handShank.frame = CGRectMake((CGRectGetWidth(bounds) - Size_HandShank) / 2.0,
                                      (CGRectGetHeight(bounds) - Size_HandShank) / 2.0,
                                      Size_HandShank, Size_HandShank)
        _handShank.backgroundColor = UIColor.magentaColor()
        _handShank.layer.cornerRadius = Size_HandShank / 2.0
        _handShank.layer.masksToBounds = true
        _backgroundView.addSubview(_handShank)
        _handShank.hidden = true
    }
    
    //MARK:Touch - Delegate
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        _backgroundView.hidden = false
        _handShank.hidden = false
        let point: CGPoint = (touches.first?.locationInView(self))!
        
        //  设置 手柄背景 和 手柄的 起始位置
        _backgroundView.center = point
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    let point: CGPoint = (touches.first?.locationInView(_backgroundView))!
        //  手柄中心在圆形背景范围内    更新手柄中心位置
        _handShank.center = point
        
        var direction: BBGamePadDirection
        let pad_x: CGFloat = point.x - CGRectGetWidth(_backgroundView.frame) / 2.0
        let pad_y: CGFloat = point.y - CGRectGetHeight(_backgroundView.frame) / 2.0
        
        if fabs(pad_x) > fabs(pad_y) {
            //  左右
            if pad_x < 0 {
                //  左
                direction = BBGamePadDirection.BBGamePadDirectionLeft
            } else {
                //  右
                direction = BBGamePadDirection.BBGamePadDirectionRight
            }
        } else {
            //  上下
            if pad_y < 0 {
                //  上
                direction = BBGamePadDirection.BBGamePadDirectionTop
            } else {
                //  下
                direction = BBGamePadDirection.BBGamePadDirectionBottom
            }
        }
        gamePadDelegate?.gamePadViewDidMove(self, direction: direction)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        _backgroundView.hidden = true
        _handShank.hidden = true
        gamePadDelegate?.gamePadViewDidMove(self, direction: BBGamePadDirection.BBGamePadDirectionCenter)
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        _backgroundView.hidden = true
        _handShank.hidden = true
        gamePadDelegate?.gamePadViewDidMove(self, direction: BBGamePadDirection.BBGamePadDirectionCenter)
    }

}
