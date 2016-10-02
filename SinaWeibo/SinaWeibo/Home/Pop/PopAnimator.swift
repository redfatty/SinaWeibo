//
//  PopAnimator.swift
//  SinaWeibo
//
//  Created by huangjiong on 16/10/2.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

import UIKit

class PopAnimator: NSObject {

    //MARK:- 属性定义
    var isPresented: Bool = true
    var presentedFrame: CGRect = CGRectZero
    var popCompletion: ((isPresent: Bool) -> ())?
}


//MARK:- 自定义转场代理方法
extension PopAnimator : UIViewControllerTransitioningDelegate {
    //定义用于控制展示弹出的控制器的view的对象
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        let presentation = PopPresentationController(presentedViewController: presented, presentingViewController: presenting)
         //设置弹出view的frame
        presentation.presentedFrame = presentedFrame
        return presentation
    }
    
    //自定义弹出动画
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresented = true//标记弹出
        //回调
        if (popCompletion != nil) {
            popCompletion!(isPresent: isPresented)
        }
        return self
    }
    
    /// 自定义消失的动画
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresented = false//标记消失
        //回调
        if (popCompletion != nil) {
            popCompletion!(isPresent: isPresented)
        }
        return self
    }
}

//MARK:- 动画弹出和消失的代理方法
extension PopAnimator: UIViewControllerAnimatedTransitioning {
    //动画时间
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    //创建动画
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if isPresented {
            createPresentAnimation(transitionContext)
        } else {
            createDismissAnimation(transitionContext)
        }
    }
    
    //MARK:- 自定义动画
    //创建弹出动画
    private func createPresentAnimation(transitionContext: UIViewControllerContextTransitioning) {
        let presentView = transitionContext.viewForKey(UITransitionContextToViewKey)
        transitionContext.containerView()?.addSubview(presentView!)
        
        //动画
        presentView?.transform = CGAffineTransformMakeScale(1.0, 0)
        presentView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            //复原
            presentView?.transform = CGAffineTransformIdentity
            }) { (finish: Bool) -> Void in
                //告诉上下文已经完成
                transitionContext.completeTransition(true)
        }
        
    }
    
    //创建消失动画
    private func createDismissAnimation(transitionContext: UIViewControllerContextTransitioning) {
        let dismissView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            //消失
            dismissView?.transform = CGAffineTransformMakeScale(1.0, 0.00001)
            }) { (finish: Bool) -> Void in
                //一定要告诉上下文动画完成了
                transitionContext.completeTransition(true)
        }
    }
}


