//
//  WebPresentTransition.swift
//
//  Created by Sun on 20/05/2022.
//

import UIKit

class WebPresentTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration: TimeInterval = 0.5
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
        containerView.frame = toViewController.view.frame
        containerView.addSubview(toViewController.view)
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
            toViewController.view.frame.origin.y = 0
        }, completion: { (finished) in
            transitionContext.completeTransition(true)
        })
    }
}
