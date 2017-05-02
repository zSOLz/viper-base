//
//  ContainerRouter.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

open class ContainerRouter: Router, ContainerRouterInterface {
    open lazy var containerViewController: ContainerViewController = ContainerViewController()
    
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
    
    override public init() {
        super.init()
        
        loadContainerController()
    }
    
    open func loadContainerController() {
        // Does nothing
    }

    override open var baseViewController: UIViewController {
        return containerViewController
    }
    
    override open var activeViewController: UIViewController? {
        return containerViewController.viewController
    }
}
