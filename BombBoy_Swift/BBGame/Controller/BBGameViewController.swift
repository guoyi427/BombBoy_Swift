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
    }
}
