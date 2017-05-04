//
//  StackRouter.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

open class StackRouter: Router, StackRouterInterface {
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
    
    override open func closeCurrentView(animated: Bool, completion: (()->())?) {
        if hasPresentedViewController {
            super.closeCurrentView(animated: animated, completion: completion)
        } else {
            navigationController.popViewController(animated: true)
        }
    }
    
    open func loadNavigationController() {
        navigationController = PresentableNavigationController()
    }
    
    open func containsViewController<ControllerType: UIViewController>(withType _: ControllerType) -> Bool {
        return navigationController.viewControllers.contains { $0 is ControllerType }
    }
    
    open func popToFirstViewController<ControllerType: UIViewController>(withType _: ControllerType, animated: Bool) -> [UIViewController] {
        for controller in navigationController.viewControllers.reversed() {
            if controller is ControllerType {
                return navigationController.popToViewController(controller, animated: animated) ?? []
            }
        }
        return []
    }
    
    // TODO: Implement child navigations automatic removal
}
