//
//  UIBarButtonItem+Category.swift
//  SinaWeibo
//
//  Created by huangjiong on 16/10/1.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(imgName: String) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imgName), forState: .Normal)
        btn.setImage(UIImage(named: imgName + "_highlighted"), forState: .Highlighted)
        btn .sizeToFit()
        
        self.init(customView: btn)
    }
}
