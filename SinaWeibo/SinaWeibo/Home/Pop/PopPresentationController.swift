//
//  PopPresentationController.swift
//  SinaWeibo
//
//  Created by huangjiong on 16/10/2.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

import UIKit

class PopPresentationController: UIPresentationController {
    
    //MARK:- 公开属性
    //外部控制弹出视图的frame
    var presentedFrame: CGRect = CGRectZero
    
    //MARK:- 私有属性
    private lazy var maskView = UIView()
    
    //重写布局方法
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        //1.设置弹出视图frame
        presentedView()?.frame = presentedFrame
        //2.添加蒙板
        setupMaskView()
    }
}


//MARK:- UI界面设置相关
extension PopPresentationController {
    private func setupMaskView() {
        containerView?.insertSubview(maskView, atIndex: 0)
        maskView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        maskView.frame = containerView!.bounds
        
        //添加一个手势
        let tapGes = UITapGestureRecognizer(target: self, action: "handleTapGes")
        maskView.addGestureRecognizer(tapGes)
    }
}


//MARK:- 事件监听
extension PopPresentationController {
    //监听点击蒙板的手势
    @objc private func handleTapGes() {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}

