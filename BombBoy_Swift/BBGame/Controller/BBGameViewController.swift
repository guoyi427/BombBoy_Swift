//
//  BBGameViewController.swift
//  BombBoy_Swift
//
//  Created by guoyi on 16/4/18.
//  Copyright © 2016年 帅毅. All rights reserved.
//

import UIKit

class BBGameViewController: BBBaseViewController {

    //  Data
    
    var _gameMapDatasources: [String: AnyObject]?
    
    
    //  UI
    
    var _gameBackgroundView: BBGameBackgroundView?
    var _boyView: BBBoyView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _prepareMapDatasources()
        
        _prepareBackgroundView()
        _prepareBoyView()
        _prepareWallView()
        _prepareGamePadView()
        _prepareAddBombGestureRecognizer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Prepare
    
    func _prepareMapDatasources() {
        _gameMapDatasources = ["id": 1,
                               "width": 9,
                               "height": 5]
        var walls = [AnyObject]()

        for i in 0 ... 3 {
            let wall: [String: Int] = ["x": i,
                                       "y": 0,
                                       "health": 1]
            walls.append(wall)
        }
        _gameMapDatasources?.updateValue(walls, forKey: "walls")
    }
    
    func _prepareBackgroundView() {
        view.backgroundColor = UIColor.whiteColor()

        _gameBackgroundView = BBGameBackgroundView(size: CGSize(width: _gameMapDatasources!["width"] as! CGFloat,
            height: _gameMapDatasources!["height"] as! CGFloat))

        view.addSubview(_gameBackgroundView!)
    }
    
    func _prepareBoyView() {
        _boyView = BBBoyView()
        _boyView!.center = CGPointMake(CGRectGetWidth(_gameBackgroundView!.frame) / 2.0, CGRectGetHeight(_gameBackgroundView!.frame) / 2.0)
        _gameBackgroundView!.addSubview(_boyView!)
    }
    
    func _prepareWallView() {
        let walls: [[String: Int]] = _gameMapDatasources!["walls"] as! Array
        for wall: Dictionary in walls {
            print("wall" + wall.description)
            let wall: BBWallView = BBWallView(x: wall["x"]!, y: wall["y"]!, health: wall["health"]!)
            _gameBackgroundView!.addSubview(wall)
        }
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
        rightView.addGestureRecognizer(tapGR)
    }
    
    
    //MARK: Gesture Recognizer - Action
    func addBombGestureRecognizerAction() {
        let bombView: BBBombView = BBBombView(point: _boyView!.frame.origin, duration: 5.0)
        bombView.delegate = self
        _gameBackgroundView!.addSubview(bombView)
        _gameBackgroundView!.bringSubviewToFront(_boyView!)
    }

}

extension BBGameViewController: BBGamePadViewDelegate {
    func gamePadViewDidMove(sender: BBGamePadView, direction: BBGamePadDirection) {
        _boyView!.moveWithDirection(direction)
        _gameBackgroundView!.moveWithDirection(direction)
    }
}

extension BBGameViewController: BBBombViewDelegate {
    func bombViewDidFinish(position: CGPoint) {
        print("bomb finish" + String(position))
        BBEmitterManager.addEmitter(_gameBackgroundView!, position: position, power: 0)
    }
}
