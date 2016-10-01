//
//  MessageViewController.swift
//  SinaWeibo
//
//  Created by huangjiong on 16/10/1.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

import UIKit

class MessageViewController: BaseTabelViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        visitorView.setupInfo(inconImg: UIImage(named: "visitordiscover_image_message"), tipTitle: "登录后, 别人评论你的微博, 给你发消息, 都会在这里收到通知")
    }
}
