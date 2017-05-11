//
//  StackRouter.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

open class StackRouter: Router, StackRouterInterface, UINavigationControllerDelegate {
    // TODO: Should we use UINavigationController instead of PresentableNavigationController
    fileprivate var innerNavigationController: PresentableNavigationController?
    open var navigationController: PresentableNavigationController {
        get {
            if let controller = innerNavigationController {
                return controller
            }

            loadNavigationController()
            guard let controller = innerNavigationController else {
                fatalError("ViperBase.StackRouter.navigationController\n" +
                    "'navigationController' variable should be initialized after 'loadNavigationController' method call.")
            }
            
            controller.delegate = self

            return controller
        }
        set {
            innerNavigationController = newValue
        }
    }
    
    override open var baseViewController: UIViewController {
        return navigationController
    }
    
    override open var activeViewController: UIViewController? {
        return navigationController.topViewController
    }
    
    override open func closeCurrentView(animated: Bool, completion: (()->Void)?) {
        if hasPresentedViewController {
            super.closeCurrentView(animated: animated, completion: completion)
        } else {
            navigationController.popViewController(animated: animated)
        }
    }
    
    open func loadNavigationController() {
        navigationController = PresentableNavigationController()
    }
    
    open func lastViewController<ControllerType: UIViewController>(withType _: ControllerType.Type) -> UIViewController? {
        return navigationController.viewControllers.reversed().first { $0 is ControllerType }
    }

    open func containsViewController<ControllerType: UIViewController>(withType _: ControllerType.Type) -> Bool {
        return (lastViewController(withType: ControllerType.self) != nil)
    }
    
    @discardableResult open func popToFirstViewController<ControllerType: UIViewController>(withType _: ControllerType.Type, animated: Bool) -> [UIViewController] {
        guard let lastViewController = lastViewController(withType: ControllerType.self) else {
            return []
        }
        return navigationController.popToViewController(lastViewController, animated: animated) ?? []
    }
    
    open var shouldAutomaticallyRemoveUnusedChildRouters: Bool {
        return true
    }
    
    // MARK: - UINavigationControllerDelegate
    
    open func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard shouldAutomaticallyRemoveUnusedChildRouters else {
            return
        }
        for router in childRouters {
            if !navigationController.childViewControllers.contains(router.baseViewController) &&
                navigationController.presentedViewController != router.baseViewController {
                router.removeFromParent()
            }
        }
    }
}
