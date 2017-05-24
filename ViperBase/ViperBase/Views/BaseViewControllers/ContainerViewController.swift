//
//  ContainerController.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

open class ContainerViewController: PresentableViewController {
    fileprivate var innerContainerView: UIView?
    @IBOutlet fileprivate(set) open var viewController: UIViewController?

    @IBOutlet open var containerView: UIView! {
        get {
            if !isViewLoaded {
                if #available(iOS 9.0, *) {
                    loadViewIfNeeded()
                } else {
                    // Load view in 'brute' way
                    let _ = view
                }
            }
            
            return innerContainerView ?? view
        }
        set(newView) {
            innerContainerView = newView
        }
    }
    
    // TODO: - Run animator: UIViewControllerContextTransitioning
    // TODO: - Check XIB loading
    open func setViewController(_ viewController: UIViewController?, animator: UIViewControllerAnimatedTransitioning? = nil) {
        if self.viewController != viewController {
            if let currentViewController = self.viewController {
                currentViewController.willMove(toParentViewController: nil)
                currentViewController.removeFromParentViewController()
                currentViewController.view.removeFromSuperview()
                currentViewController.didMove(toParentViewController: nil)
                
                containerView = nil
            }
            
            self.viewController = viewController
            
            if let newViewController = viewController {
                newViewController.willMove(toParentViewController: self)
                
                newViewController.view.frame = containerView.bounds
                containerView.addSubview(newViewController.view)
                containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                
                addChildViewController(newViewController)
                viewController?.didMove(toParentViewController: self)
            }
        }
    }
}
