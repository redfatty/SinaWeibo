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
    
    private lazy var composeBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComposeBtn()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        setupTabBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MainViewController {
    //设置发布按钮
    private func setupComposeBtn() {
        tabBar.addSubview(composeBtn)
        composeBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
        composeBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: .Selected)
        composeBtn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
        composeBtn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: .Selected)
        composeBtn.sizeToFit()
        composeBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.height * 0.5)
    }
    
    //设置tabBar
    private func setupTabBar() {
        for i in 0..<tabBar.items!.count {
            let item = tabBar.items![i]
            if i == 2 {
                item.enabled = false
                continue
            }
            item.selectedImage = UIImage(named: tabBarItemImges[i] + "_highlighted")
        }
    }
}
