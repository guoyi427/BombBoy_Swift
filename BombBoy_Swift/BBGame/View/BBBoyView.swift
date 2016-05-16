//
//  BBBoyView.swift
//  BombBoy_Swift
//
//  Created by guoyi on 16/4/25.
//  Copyright © 2016年 帅毅. All rights reserved.
//

import UIKit

class BBBoyView: BBBaseView {
    
    var _updateTimer: NSTimer? = nil
    var _direction: BBGamePadDirection = BBGamePadDirection.BBGamePadDirectionCenter
    
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

    func updateTimerAction() {
        var newFrame: CGRect = self.frame
        
        switch _direction {
        case .BBGamePadDirectionLeft:
            newFrame.origin.x -= Size_Boy
        case .BBGamePadDirectionRight:
            newFrame.origin.x += Size_Boy
        case .BBGamePadDirectionTop:
            newFrame.origin.y -= Size_Boy
        case .BBGamePadDirectionBottom:
            newFrame.origin.y += Size_Boy
        default:
            _updateTimer?.invalidate()
            _updateTimer = nil
        }
        self.frame = newFrame

    }
    
    //MARK:公有方法
    func moveWithDirection(direction: BBGamePadDirection) {
        
        if (_updateTimer == nil) {
            _updateTimer = NSTimer.scheduledTimerWithTimeInterval(_speed, target: self, selector: #selector(BBBoyView.updateTimerAction), userInfo: nil, repeats: true)
        }
        
        _direction = direction
    }
    
}
