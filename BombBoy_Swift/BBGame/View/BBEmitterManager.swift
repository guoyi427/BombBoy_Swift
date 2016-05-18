//
//  BBEmitterManager.swift
//  BombBoy_Swift
//
//  Created by guoyi on 16/5/18.
//  Copyright © 2016年 帅毅. All rights reserved.
//

import UIKit

class BBEmitterManager: NSObject {

    class func addEmitter(superView: UIView, position: CGPoint, power: NSInteger) {
        let rect = CGRect(x: position.x - Size_Boy/2.0,
                          y: position.y - Size_Boy/2.0,
                          width: Size_Boy,
                          height: Size_Boy)
        let emitter = CAEmitterLayer()
        emitter.frame = rect
        superView.layer.addSublayer(emitter)
        
        emitter.emitterShape = kCAEmitterLayerCircle
        emitter.renderMode = kCAEmitterLayerAdditive
        
        //kCAEmitterLayerPoint
        //kCAEmitterLayerLine
        //kCAEmitterLayerRectangle
        
        emitter.emitterPosition = CGPointMake(rect.width/2, rect.height/2)
        emitter.emitterSize = rect.size
        
        // 添加cell
        let cells: [CAEmitterCell] = prepareCells()
        
        emitter.emitterCells = cells  //这里可以设置多种粒子 我们以一种为粒子
        
        performSelector(#selector(BBEmitterManager.removeEmitterLayer(_:)), withObject: emitter, afterDelay: 1)
    }
    
    class func prepareCells() -> [CAEmitterCell] {
        
        return [addCell(0), addCell(1), addCell(2), addCell(3)]
    }
    
    class func addCell(direction: NSInteger) -> CAEmitterCell {
        let emitterCell = CAEmitterCell()
        
        emitterCell.contents = UIImage(named: "xh")!.CGImage
        emitterCell.birthRate = 20  //每秒产生120个粒子
        emitterCell.lifetime = 1    //存活1秒
        emitterCell.lifetimeRange = 3.0
        
        //        emitterCell.yAcceleration = 70.0  //给Y方向一个加速度
        //        emitterCell.xAcceleration = 20.0 //x方向一个加速度
        emitterCell.velocity = 50.0 //初始速度
        //        emitterCell.velocityRange = 200.0   //随机速度 -200+20 --- 200+20
        //        emitterCell.emissionRange = CGFloat(M_PI_2) //随机方向 -pi/2 --- pi/2
        //emitterCell.color = UIColor(red: 0.9, green: 1.0, blue: 1.0,
        //   alpha: 1.0).CGColor //指定颜色
        emitterCell.redRange = 0.8
        emitterCell.greenRange = 0.1
        emitterCell.blueRange = 0.1  //三个随机颜色
        
        emitterCell.scale = 0.8
        emitterCell.scaleRange = 0.8  //0 - 1.6
        emitterCell.scaleSpeed = -0.15  //逐渐变小
        
        emitterCell.alphaRange = 0.75   //随机透明度
        emitterCell.alphaSpeed = -0.15  //逐渐消失
        
        //  方向
        switch direction {
        case 0:
            emitterCell.emissionLongitude = CGFloat(-M_PI) / 2  //  上
        case 1:
            emitterCell.emissionLongitude = CGFloat(0)   //  右
        case 2:
            emitterCell.emissionLongitude = CGFloat(M_PI) / 2  //  下
        case 3:
            emitterCell.emissionLongitude = CGFloat(-M_PI)   //  左
        default:
            emitterCell.emissionLongitude = 0;
            break
        }
        
        return emitterCell
    }
    
    class func removeEmitterLayer(emitter: CAEmitterLayer) {
        emitter.removeAllAnimations()
        emitter.removeFromSuperlayer()
    }
}
