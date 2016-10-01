//
//  BaseTabelViewController.swift
//  SinaWeibo
//
//  Created by huangjiong on 16/10/1.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

import UIKit

class BaseTabelViewController: UITableViewController {

    //标记是否已经登录
    var isLogin = false
    
    //访客视图
    lazy var visitorView = VisitorView.loadNib()
    
    override func loadView() {
        isLogin ? super.loadView() : setupVisitorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

}


extension BaseTabelViewController {
    func setupVisitorView() {
        view = visitorView
        view.backgroundColor = UIColor.redColor()
    }
}