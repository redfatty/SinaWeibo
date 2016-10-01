//
//  VisitorView.swift
//  SinaWeibo
//
//  Created by huangjiong on 16/10/1.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    class func loadNib() -> VisitorView {
        return NSBundle.mainBundle().loadNibNamed("VisitorView", owner: nil, options: nil).last as! VisitorView
    }

}
