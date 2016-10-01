//
//  UIButton+Category.swift
//  SinaWeibo
//
//  Created by huangjiong on 16/10/1.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

import UIKit

extension UIButton {
    //对系统的类定义便利构造函数
    //1.使用convenience
    //2.无返回值
    //3.必须调用self.init()
    convenience init(imgName: String, bgImgName: String) {
        self.init()
        
        setImage(UIImage(named: imgName), forState: .Normal)
        setImage(UIImage(named: imgName + "_highlighted"), forState: .Highlighted)
        setBackgroundImage(UIImage(named: bgImgName), forState: .Normal)
        setBackgroundImage(UIImage(named: bgImgName + "_highlighted"), forState: .Highlighted)
        sizeToFit()
    }
}
