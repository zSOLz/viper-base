//
//  StackRouter.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

open class StackRouter: Router, StackRouterInterface {
    open lazy var navigationController = UINavigationController()

    override public init() {
        super.init()
        
        loadNavigationController()
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
        // Does nothing
    }
}
