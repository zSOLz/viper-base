//
//  TabRouter.swift
//  ViperBase
//
//  Created by SOL on 02.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

open class TabRouter: Router, StackRouterInterface {
    // TODO: Should we use UITabBarController instead of PresentableTabBarController
    fileprivate var innerTabBarController: PresentableTabBarController?
    open var tabBarController: PresentableTabBarController {
        get {
            if let controller = innerTabBarController {
                return controller
            }
            
            loadTabBarController()
            
            guard let controller = innerTabBarController else {
                fatalError("ViperBase.TabRouter.tabBarController\n" +
                    "'tabBarController' variable should be initialized after 'loadTabBarController' method call.")
            }
            return controller
        }
        set {
            innerTabBarController = newValue
        }
    }
    
    override open var baseViewController: UIViewController {
        return tabBarController
    }
    
    override open var activeViewController: UIViewController? {
        return tabBarController.selectedViewController
    }
    
    open func loadTabBarController() {
        tabBarController = PresentableTabBarController()
    }
    
    open func viewController<ControllerType: UIViewController>(withType _: ControllerType.Type) -> UIViewController? {
        return tabBarController.viewControllers?.first { $0 is ControllerType }
    }
    
    open func containsViewController<ControllerType: UIViewController>(withType _: ControllerType.Type) -> Bool {
        return (viewController(withType: ControllerType.self) != nil)
    }
    
    open func selectViewController<ControllerType: UIViewController>(withType _: ControllerType.Type) {
        guard let viewController = viewController(withType: ControllerType.self) else {
            return
        }

        tabBarController.selectedViewController = viewController
    }
    
    open func selectViewController<RouterType: Router>(withRouterType _: RouterType.Type) {
        guard let router = childRouters.first(where: { $0 is RouterType }) else {
            assertionFailure("ViperBase.TabRouter.selectViewController(withRouterType:)\n" +
                "Could not find router with required type")
            return
        }
        
        guard (tabBarController.viewControllers?.contains(router.baseViewController) ?? false) else {
            assertionFailure("ViperBase.TabRouter.selectViewController(withRouterType:)\n" +
                "Tab bar controller does not contain router's base view controller")
            return
        }

        tabBarController.selectedViewController = router.baseViewController
    }
}
