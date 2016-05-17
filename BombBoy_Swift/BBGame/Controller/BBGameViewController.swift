//
//  BBGameViewController.swift
//  BombBoy_Swift
//
//  Created by guoyi on 16/4/18.
//  Copyright © 2016年 帅毅. All rights reserved.
//

import UIKit

class BBGameViewController: BBBaseViewController {

    var _gameBackgroundView: BBGameBackgroundView = BBGameBackgroundView(size: CGSize(width: 49, height: 29));
    var _boyView: BBBoyView = BBBoyView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _prepareBackgroundView()
        _prepareBoyView()
        _prepareGamePadView()
        _prepareAddBombGestureRecognizer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Prepare
    
    func _prepareBackgroundView() {
        view.backgroundColor = UIColor.whiteColor()

        view.addSubview(_gameBackgroundView)
    }
    
    func _prepareBoyView() {
        _boyView.center = CGPointMake(CGRectGetWidth(_gameBackgroundView.frame) / 2.0, CGRectGetHeight(_gameBackgroundView.frame) / 2.0)
        _gameBackgroundView.addSubview(_boyView)
    }
    
    func _prepareGamePadView() {
        let gamePad: BBGamePadView = BBGamePadView()
        gamePad.gamePadDelegate = self
        view.addSubview(gamePad)
    }
    
    func _prepareAddBombGestureRecognizer() {
        let tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BBGameViewController.addBombGestureRecognizerAction))
        let rightView: UIView = UIView(frame: CGRect(x: CGRectGetWidth(view.frame) / 2.0, y: 0, width: CGRectGetWidth(view.frame), height: CGRectGetHeight(view.frame)))
        view.addSubview(rightView)
        view.addGestureRecognizer(tapGR)
    }
    
    
    //MARK: Gesture Recognizer - Action
    func addBombGestureRecognizerAction() {
        let bombView: BBBombView = BBBombView(point: _boyView.frame.origin, duration: 5.0)
        bombView.delegate = self
        _gameBackgroundView.addSubview(bombView)
        _gameBackgroundView.bringSubviewToFront(_boyView)
    }

}

extension BBGameViewController: BBGamePadViewDelegate {
    func gamePadViewDidMove(sender: BBGamePadView, direction: BBGamePadDirection) {
        _boyView.moveWithDirection(direction)
        _gameBackgroundView.moveWithDirection(direction)
    }
}

extension BBGameViewController: BBBombViewDelegate {
    func bombViewDidFinish(position: CGPoint) {
        print("bomb finish" + String(position))
        let rect = CGRect(x: position.x, y: position.y, width: Size_Boy,
                          height: Size_Boy)
        let emitter = CAEmitterLayer()
        emitter.frame = rect
        _gameBackgroundView.layer.addSublayer(emitter)
        emitter.emitterShape = kCAEmitterLayerRectangle
        emitter.emitterMode = kCAEmitterLayerVolume
        emitter.renderMode = kCAEmitterLayerUnordered
        
        //kCAEmitterLayerPoint
        //kCAEmitterLayerLine
        //kCAEmitterLayerRectangle
        
        emitter.emitterPosition = CGPointMake(rect.width/2, rect.height/2)
        emitter.emitterSize = rect.size
        
        let emitterCell = CAEmitterCell()
    
        emitterCell.contents = UIImage(named: "xh")!.CGImage
        emitterCell.birthRate = 120  //每秒产生120个粒子
        emitterCell.lifetime = 3    //存活1秒
        emitterCell.lifetimeRange = 3.0
        
        emitter.emitterCells = [emitterCell]  //这里可以设置多种粒子 我们以一种为粒子
        emitterCell.yAcceleration = 70.0  //给Y方向一个加速度
        emitterCell.xAcceleration = 20.0 //x方向一个加速度
        emitterCell.velocity = 20.0 //初始速度
        emitterCell.emissionLongitude = CGFloat(-M_PI) //向左
        emitterCell.velocityRange = 200.0   //随机速度 -200+20 --- 200+20
        emitterCell.emissionRange = CGFloat(M_PI_2) //随机方向 -pi/2 --- pi/2
        //emitterCell.color = UIColor(red: 0.9, green: 1.0, blue: 1.0,
        //   alpha: 1.0).CGColor //指定颜色
        emitterCell.redRange = 0.3
        emitterCell.greenRange = 0.3
        emitterCell.blueRange = 0.3  //三个随机颜色
        
        emitterCell.scale = 0.8
        emitterCell.scaleRange = 0.8  //0 - 1.6
        emitterCell.scaleSpeed = -0.15  //逐渐变小
        
        emitterCell.alphaRange = 0.75   //随机透明度
        emitterCell.alphaSpeed = -0.15  //逐渐消失
    }
}
