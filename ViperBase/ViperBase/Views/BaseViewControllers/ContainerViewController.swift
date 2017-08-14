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
    
    open func transitionContext(containerView: UIView,
                                from fromViewController: UIViewController? = nil,
                                to toViewController: UIViewController? = nil) -> ContainerViewControllerTransitionContext {
        return ContainerViewControllerTransitionContext(containerView: containerView,
                                                        from: fromViewController,
                                                        to: toViewController)
    }
    
    open func setViewController(_ toViewController: UIViewController?, animator: UIViewControllerAnimatedTransitioning? = nil) {
        if viewController != toViewController {
            if let animator = animator {
                let fromViewController = viewController
                viewController = toViewController
                
                let context = transitionContext(containerView: containerView,
                                                from: fromViewController,
                                                to: toViewController)
                
                fromViewController?.willMove(toParentViewController: nil)
                toViewController?.willMove(toParentViewController: self)
                if let toViewController = toViewController {
                    containerView.addSubview(toViewController.view)
                }
                
                animator.animateTransition(using: context)
                DispatchQueue.main.asyncAfter(deadline: .now() + animator.transitionDuration(using: context), execute: { [weak self] in
                    if let fromViewController = fromViewController {
                        fromViewController.removeFromParentViewController()
                        fromViewController.view.removeFromSuperview()
                        fromViewController.didMove(toParentViewController: nil)
                    }
                    
                    if let toViewController = toViewController {
                        self?.addChildViewController(toViewController)
                        toViewController.didMove(toParentViewController: self)
                    }
                    
                    animator.animationEnded?(true)
                })
            } else {
                let fromViewController = viewController
                viewController = toViewController
                
                if let fromViewController = fromViewController {
                    fromViewController.willMove(toParentViewController: nil)
                    fromViewController.removeFromParentViewController()
                    fromViewController.view.removeFromSuperview()
                    fromViewController.didMove(toParentViewController: nil)
                }
                
                if let toViewController = toViewController {
                    toViewController.willMove(toParentViewController: self)
                    addChildViewController(toViewController)
                    
                    containerView.addSubview(toViewController.view)
                    toViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                    toViewController.view.frame = containerView.bounds
                    
                    toViewController.didMove(toParentViewController: self)
                }
            }
        }
    }
}
