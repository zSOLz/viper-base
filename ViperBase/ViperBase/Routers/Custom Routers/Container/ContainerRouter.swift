//
//  ContainerRouter.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

/**
 Custom router represents capabilities of container controller: One active child controller at the moment.
 Use it to implement signle screen with different content screens on it. All transitions can be animated.
 By default this class implements only base container logic. Subclass it to add specipic behavior.
 */
open class ContainerRouter: Router, ContainerRouterInterface {
    /// Strong reference to container controller
    fileprivate var innerContainerViewController: ContainerViewController?
    
    /// Initialized container controller's property. In case container controller is not initialized calls *loadContainerViewController()* method (Similar to *loadView()* pattern of UIViewController class).
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

    /// Child content router.
    /// **Get:** returns first child router added as content.
    /// **Set:** removes current content router, adds new contentRouter as child and set its base view controller as content.
    open var contentRouter: Router? {
        get {
            return childRouters.first { containerViewController.viewController == $0.baseViewController }
        }
        set(newRouter) {
            if let router = contentRouter {
                router.removeFromParent()
            }
            if let router = newRouter {
                addChild(router: router)
            }
            containerViewController.setViewController(newRouter?.baseViewController)
        }
    }
    
    /// Creates the conainer view controller that the router manages. You should never call this method directly.
    /// The container router calls method when its container view controller is never beeng initialized.
    /// The default implementation of this method creates object of *ContainerViewController* class and assigns it to *containerViewController* property.
    /// Override this method to assign custom conainer controller.
    open func loadContainerViewController() {
        containerViewController = ContainerViewController()
    }
    
    /// Overrided property of 'Router' class.
    /// Returns the same object as *containerViewController* property.
    override open var baseViewController: UIViewController {
        return containerViewController
    }
    
    /// Overrided property of 'Router' class.
    /// Returns the current active view controller in container view controller
    override open var activeViewController: UIViewController? {
        return containerViewController.viewController
    }
}
