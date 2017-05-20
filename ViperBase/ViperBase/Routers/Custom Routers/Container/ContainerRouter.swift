//
//  ContainerRouter.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

open class ContainerRouter: Router, ContainerRouterInterface {
    fileprivate var innerContainerViewController: ContainerViewController?
    open var containerViewController: ContainerViewController {
        get {
            if let controller = innerContainerViewController {
                return controller
            }
            
            loadContainerViewController()
            
            guard let controller = innerContainerViewController else {
                fatalError("ViperBase.ContainerRouter.containerViewController\n" +
                    "'containerViewController' variable should be initialized after 'loadContainerViewController' method call.")
            }
            return controller
        }
        set {
            innerContainerViewController = newValue
        }
    }

    open var contentRouter: Router? {
        get {
            return childRouters.first
        }
        set(newRouter) {
            for router in childRouters {
                router.removeFromParent()
            }
            if let router = newRouter {
                addChild(router: router)
            }
            containerViewController.setViewController(newRouter?.baseViewController)
        }
    }
    
    open func loadContainerViewController() {
        containerViewController = ContainerViewController()
    }

    override open var baseViewController: UIViewController {
        return containerViewController
    }
    
    override open var activeViewController: UIViewController? {
        return containerViewController.viewController
    }
}
