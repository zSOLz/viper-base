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
    
    open func containsViewController<ControllerType: UIViewController>(withType _: ControllerType) -> Bool {
        guard let viewControllers = tabBarController.viewControllers else {
            return false
        }
        return viewControllers.contains { $0 is ControllerType }
    }
    
    open func selectViewController<ControllerType: UIViewController>(withType _: ControllerType, animated: Bool) {
        guard let viewControllers = tabBarController.viewControllers else {
            return
        }

        for controller in viewControllers {
            if controller is ControllerType {
                tabBarController.selectedViewController = controller
            }
        }
    }
}
