//
//  TabRouter.swift
//  ViperBase
//
//  Created by SOL on 02.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

open class TabRouter: Router, StackRouterInterface {
    open lazy var tabBarController: PresentableTabBarController = PresentableTabBarController()
    
    override public init() {
        super.init()
        
        loadTabBarController()
    }
    
    override open var baseViewController: UIViewController {
        return tabBarController
    }
    
    override open var activeViewController: UIViewController? {
        return tabBarController.selectedViewController
    }
    
    open func loadTabBarController() {
        // Does nothing
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
