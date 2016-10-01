//
//  ProfileViewController.swift
//  SinaWeibo
//
//  Created by huangjiong on 16/10/1.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

import UIKit

class ProfileViewController: BaseTabelViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView.setupInfo(inconImg: UIImage(named: "visitordiscover_image_profile"), tipTitle: "登录后, 你的微博,相册,个人资料会显示在这里, 展示给别人")
    }

}
