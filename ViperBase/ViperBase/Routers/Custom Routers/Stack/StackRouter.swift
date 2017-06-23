//
//  StackRouter.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

/**
 Custom router represents capabilities of navigation controller: This is base class to use navigation controller's push/pop logic.
 Use it to implement navigation based routing logic.
 By default this class implements only base navigation controller logic. Subclass it to add specipic behavior.
 */
open class StackRouter: Router, StackRouterInterface, UINavigationControllerDelegate {
    /// Strong reference to navigation controller
    fileprivate var innerNavigationController: PresentableNavigationController?
    
    /// Initialized navigation controller's property. In case navigation controller is not initialized calls *loadNavigationController()* method (Similar to *loadView()* pattern of UIViewController class).
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
    
    /// Overrided property of 'Router' class.
    /// Returns the same object as *navigationController* property.
    override open var baseViewController: UIViewController {
        return navigationController
    }
    
    /// Overrided property of 'Router' class.
    /// Returns the top view controller of navigation controller
    override open var activeViewController: UIViewController? {
        return navigationController.topViewController
    }
    
    /// Overridden method of 'Router' class. /// Pop top view controller if this action is available (number of pushed controllers more than one).
    /// Otherwise called its base implementation.
    override open func closeCurrentView(animated: Bool, completion: (()->Void)?) {
        if hasPresentedViewController || navigationController.viewControllers.count <= 1 {
            super.closeCurrentView(animated: animated, completion: completion)
        } else {
            navigationController.popViewController(animated: animated)
        }
    }
    
    /// Creates the navigation controller that the stack router manages. You should never call this method directly.
    /// The stack router calls method when its navigation controller is never beeng initialized.
    /// The default implementation of this method creates object of *PresentableNavigationController* class and assigns it to *navigationController* property.
    /// Override this method to assign custom navigation controller.
    open func loadNavigationController() {
        navigationController = PresentableNavigationController()
    }
    
    /// Returns last popped view controller with given type if exists. Otherwise returns nil.
    /// - parameter type: view controller's type to find
    open func lastViewController<ControllerType: UIViewController>(withType type: ControllerType.Type) -> UIViewController? {
        return navigationController.viewControllers.reversed().first { $0 is ControllerType }
    }

    /// Returns **true** if view controller with given type is found in navigation controller's stack. Otherwise returns **false**.
    /// - parameter type: view controller type to find
    open func containsViewController<ControllerType: UIViewController>(withType type: ControllerType.Type) -> Bool {
        return (lastViewController(withType: ControllerType.self) != nil)
    }
    
    /// Pops all view controllers till controller with given type. View controller with given type will be at the top of navigation stack.
    /// If navigation controller does not contain view controller with given type the method does nothing.
    /// - parameter type: view controller's type to  find
    /// - parameter animated: should pop animation be animated or not
    /// - returns: array of popped view controller. If navigation controller does not contain view controller with given type returns empty array.
    @discardableResult open func popToFirstViewController<ControllerType: UIViewController>(withType type: ControllerType.Type, animated: Bool) -> [UIViewController] {
        guard let lastViewController = lastViewController(withType: ControllerType.self) else {
            return []
        }
        return navigationController.popToViewController(lastViewController, animated: animated) ?? []
    }
    
    /// Should the navigation router automatically remove all child routers with view controller whitch are not in the navigation stack.
    /// Default value is *true*.
    open var shouldAutomaticallyRemoveUnusedChildRouters: Bool {
        return true
    }
    
    /// Returns default array of currently unused child routers. Being called during an automatic child controllers removal.
    /// Override to change the list of automatically removed routers.
    open var unusedChildRouters: [Router] {
        return childRouters.filter({ router -> Bool in
            return !(navigationController.presentedViewController == router.baseViewController || navigationController.childViewControllers.contains(router.baseViewController))
        })
    }
    
    // MARK: - UINavigationControllerDelegate
    
    open func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if shouldAutomaticallyRemoveUnusedChildRouters {
            unusedChildRouters.forEach { $0.removeFromParent() }
        }
    }
}
