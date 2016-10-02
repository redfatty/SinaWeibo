//
//  HomeViewController.swift
//  SinaWeibo
//
//  Created by huangjiong on 16/10/1.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

import UIKit

class HomeViewController: BaseTabelViewController {
    
    //MARK:- 属性定义:
    private lazy var titleBtn: TitleArrowButton = TitleArrowButton()

    //MARK:- 系统回调:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !isLogin {
            visitorView.addRotationAnimation()
        } else  {
            setupNavBar()
        }
    }

}

//FIXME:

//MARK:- UI设置
extension HomeViewController {
    //设置导航栏
    private func setupNavBar() {
        //1.左右按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: "navigationbar_friendattention")
        navigationItem.rightBarButtonItem = UIBarButtonItem(imgName: "navigationbar_pop")
        
        //2.titleView
        titleBtn.setTitle("redfatty的微博", forState: .Normal)
        titleBtn.addTarget(self, action: "clickNavTitleBtn:", forControlEvents: .TouchUpInside)
        navigationItem.titleView = titleBtn
    }
}

extension HomeViewController {
    //MARK:- 按钮点击事件
    //MARK:-点击导航栏标题
    @objc private func clickNavTitleBtn(btn: TitleArrowButton) {
        btn.selected = !btn.selected
        //弹出
        let vc = UIViewController()
    }
}

