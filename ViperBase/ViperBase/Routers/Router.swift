//
//  Router.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

open class Router: NSObject, RouterInterface {
    open fileprivate(set) lazy var childRouters = [Router]()
    open fileprivate(set) weak var parentRouter: Router?
    
    open var baseViewController: UIViewController {
        fatalError("ViperBase.Router.baseViewController\n" +
            "Abstract getter. Please override 'baseViewController' getter in child class")
    }
    
    open var activeViewController: UIViewController? {
        fatalError("ViperBase.Router.activeController\n" +
            "Abstract getter. Please override 'activeController' getter in child class")
    }

    open func addChild(router: Router) {
        if router.parentRouter != nil {
            assertionFailure("ViperBase.Router.addChild(router:)\n" +
                "Attempt to add child router which already has parent")
        }
        
        if childRouters.contains(router) {
            assertionFailure("ViperBase.Router.addChild(router:)\n" +
                "Child router already contains in children routers list")
        }
        
        childRouters.append(router)
        router.parentRouter = self
    }
    
    open func removeFromParent() {
        guard let parentRouter = parentRouter else {
            return
        }

        guard let index = parentRouter.childRouters.index(of: self) else {
            assertionFailure("ViperBase.Router.removeFromParent()\n" +
                "Parent router does not contain current router in children list")
            self.parentRouter = nil
            return
        }
        
        parentRouter.childRouters.remove(at: index)
        self.parentRouter = nil
    }
    
    open var shouldAutomaticallyDismissModalController: Bool {
        return true
    }
    
    open var hasPresentedViewController: Bool {
        return (baseViewController.presentedViewController != nil)
    }

    // MARK: - RouterInterface

    open func closeCurrentView() {
        closeCurrentView(animated: true)
    }
    
    open func closeCurrentView(animated: Bool) {
        closeCurrentView(animated: true, completion: nil)
    }

    open func closeCurrentView(animated: Bool, completion: (()->())?) {
        if shouldAutomaticallyDismissModalController && hasPresentedViewController {
            baseViewController.dismiss(animated: animated, completion: completion)
        } else {
            completion?()
        }
    }
}
