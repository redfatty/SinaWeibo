//
//  MainViewController.swift
//  SinaWeibo
//
//  Created by huangjiong on 16/10/1.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    private lazy var tabBarItemImges = [
        "tabbar_home",
        "tabbar_message_center",
        "",
        "tabbar_discover",
        "tabbar_profile"
    ]
    
    private lazy var composeBtn = UIButton(imgName: "tabbar_compose_icon_add", bgImgName: "tabbar_compose_button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComposeBtn()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //如果要在代码中设置的话, 一定要在viewWillAppear中设置, 不能在viewDidLoad设置
        setupTabBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//ui设置
extension MainViewController {
    //设置发布按钮
    private func setupComposeBtn() {
        tabBar.addSubview(composeBtn)
        composeBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.height * 0.5)
        composeBtn.addTarget(self, action: "clickComposeBtn", forControlEvents: .TouchUpInside)
    }
    
    //设置tabBar
    private func setupTabBar() {
        //已经在storyboard中设置好了
//        for i in 0..<tabBar.items!.count {
//            let item = tabBar.items![i]
//            if i == 2 {
//                item.enabled = false
//                continue
//            }
//            item.selectedImage = UIImage(named: tabBarItemImges[i] + "_highlighted")
//        }
    }
}


//监听事件
extension MainViewController {
    @objc private func clickComposeBtn() {
        print("点击发布")
    }
}
