//
//  BaseTabelViewController.swift
//  SinaWeibo
//
//  Created by huangjiong on 16/10/1.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

import UIKit

class BaseTabelViewController: UITableViewController {

    //MARK: - 属性定义:
    //标记是否已经登录
    var isLogin = !false
    //访客视图
    lazy var visitorView = VisitorView.loadNib()
    
    override func loadView() {
        isLogin ? super.loadView() : setupVisitorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavItems()
    }

}

//MARK:- UI设置
extension BaseTabelViewController {
    //设置访客视图
    private func setupVisitorView() {
        //监听访客视图中的按钮点击
        visitorView.registerBtn.addTarget(self, action: "clickRegisterBtn", forControlEvents: .TouchUpInside)
        visitorView.loginBtn.addTarget(self, action: "clickLoginBtn", forControlEvents: .TouchUpInside)
        view = visitorView
    }
    
    //设置导航栏item
    private func setupNavItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: "clickRegisterBtn")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .Plain, target: self, action: "clickLoginBtn")
    }
}

//MARK:- 事件监听
extension BaseTabelViewController {
    //注册
    @objc private func clickRegisterBtn() {
        print("点击注册")
    }
    
    //登录
    @objc private func clickLoginBtn() {
        print("点击登录")
    }
}