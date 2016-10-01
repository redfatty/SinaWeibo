//
//  VisitorView.swift
//  SinaWeibo
//
//  Created by huangjiong on 16/10/1.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    @IBOutlet weak var rotationView: UIImageView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    class func loadNib() -> VisitorView {
        return NSBundle.mainBundle().loadNibNamed("VisitorView", owner: nil, options: nil).last as! VisitorView
    }
    
    func setupInfo(inconImg iconImg: UIImage?, tipTitle: String) {
        iconView.image = iconImg
        tipLabel.text = tipTitle
        rotationView.hidden = true
    }
    
    func addRotationAnimation() {
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnim.fromValue = 0
        rotationAnim.toValue = 2 * M_PI
        rotationAnim.repeatCount = MAXFLOAT//一直循环
        rotationAnim.duration = 5
        rotationAnim.removedOnCompletion = false//不让系统移除
        
        rotationView.layer.addAnimation(rotationAnim, forKey: "rotationAnim")
    }
    
    deinit {
       rotationView.layer.removeAnimationForKey("rotationAnim")
    }
}

