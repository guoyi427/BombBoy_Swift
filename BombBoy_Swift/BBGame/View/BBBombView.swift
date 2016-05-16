//
//  BBBombView.swift
//  BombBoy_Swift
//
//  Created by guoyi on 16/5/16.
//  Copyright © 2016年 帅毅. All rights reserved.
//

import UIKit

protocol BBBombViewDelegate: class {
    func bombViewDidFinish(position: CGPoint)
}

class BBBombView: BBBaseView {

    var _duration: NSTimeInterval = 5
    weak var delegate: BBBombViewDelegate?
    
    init(point: CGPoint, duration: NSTimeInterval) {
        super.init(frame: CGRect(origin: point, size: CGSizeMake(Size_Boy, Size_Boy)))
        backgroundColor = UIColor.blackColor()
        _duration = duration
        performSelector(#selector(BBBombView.removeSelf), withObject: nil, afterDelay: _duration)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func removeSelf() {
        delegate?.bombViewDidFinish(center)
        removeFromSuperview()
    }

}
