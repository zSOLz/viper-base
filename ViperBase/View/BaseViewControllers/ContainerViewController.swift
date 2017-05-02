//
//  ContainerController.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

open class ContainerViewController: PresentableViewController {
    @IBOutlet public var containerView: UIView?
    @IBOutlet fileprivate(set) open var viewController: UIViewController?

    open var currentContainerView: UIView {
        if !isViewLoaded {
            loadViewIfNeeded()
        }
        
        return containerView ?? view
    }
    
    // TODO: - Run animator: UIViewControllerContextTransitioning
    open func setViewController(_ viewController: UIViewController?, animator: UIViewControllerAnimatedTransitioning? = nil) {
        if self.viewController != viewController {
            if let currentViewController = self.viewController {
                currentViewController.willMove(toParentViewController: nil)
                currentViewController.removeFromParentViewController()
                currentViewController.view.removeFromSuperview()
                currentViewController.didMove(toParentViewController: nil)
            }
            
            self.viewController = viewController
            
            if let newViewController = viewController {
                newViewController.willMove(toParentViewController: self)
                
                newViewController.view.frame = currentContainerView.bounds
                currentContainerView.addSubview(newViewController.view)
                currentContainerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                
                addChildViewController(newViewController)
                viewController?.didMove(toParentViewController: self)
            }
        }
    }
}
