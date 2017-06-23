//
//  Router.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

/**
 The base class for the navigation(routing) logic in VIPER arhitecture. Basically one router is connected with one container controller like PresentableNavigationController, PresentableTabBarController and e.t.c.
 All navigation logic as well as screen transition control should be kept it this 'Router' layer.
 Custom router can interact with 'Views' and 'Presenters' layers to setup screens in proper way.

 Custom router may contain:
 - Strong references to assembly interface
 - In most cases, strong references to base container controllr
 - Strong references to it's child routers ('childRouters' property)
 - Weak reference to its parent router
 */
open class Router: NSObject, RouterInterface {
    /// All child routers references to keep tree-like application navigation structure.
    /// Use *addChild(router:)* and *removeFromParent()* to modify this array.
    open fileprivate(set) lazy var childRouters = [Router]()
    
    /// The rotuer's parent, or nil if it has none
    open fileprivate(set) weak var parentRouter: Router?
    
    /// The base container controller associated with this router. Each custom router must return the ViewController's object
    open var baseViewController: UIViewController {
        fatalError("ViperBase.Router.baseViewController\n" +
            "Abstract getter. Please override 'baseViewController' getter in child class")
    }
    
    /// The currently active (top, selected, etc.) view controller inside the container controller
    open var activeViewController: UIViewController? {
        fatalError("ViperBase.Router.activeViewController\n" +
            "Abstract getter. Please override 'activeController' getter in child class")
    }

    /// Adds a router to the end of the list of child routers. Use this method to build navigation tree-like structure inside you application.
    /// - parameter router: router object that should be added as child. This router should not have parent before the method call.
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
    
    /// Removes a router from its parent's child routers list
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
    
    /// Present router modally router and add it to child routers list
    /// - parameter router: router object that should be added as child. This router should not have parent before the method call.
    /// - parameter animated: if presenting will be animated or not
    /// - parameter completion: the closure to execute after the presentation finishes
    open func presentModalRouter(_ router: Router, animated: Bool = true, completion: (()->Void)? = nil) {
        addChild(router: router)
        baseViewController.present(router.baseViewController, animated: true, completion: completion)
    }
    
    /// Dismiss modally presented router also remove this router from child list
    /// - parameter router: child router to be dismissed
    /// - parameter animated: if dismissing will be animated or not
    /// - parameter completion: the closure to execute after the dismissing finishes
    open func dismissModalRouter(_ router: Router, animated: Bool = true, completion: (()->Void)? = nil) {
        guard router.parentRouter == self else {
            assertionFailure("ViperBase.Router.dismissModalRouter(:animated:completion:)\n" +
                "Unable to dismiss modal router: invalid parent router")
            return
        }

        guard router.baseViewController == baseViewController.presentedViewController else {
            assertionFailure("ViperBase.Router.dismissModalRouter(:animated:completion:)\n" +
                "Unable to dismiss modal router: base view controller should be presented modally")
            return
        }

        router.removeFromParent()
        baseViewController.dismiss(animated: animated, completion: completion)
    }
    
    /// Should current router automatically dismiss modally presented view controller or router on *closeCurrentView* method call. Override to change closing behavior. Default value is *true*.
    open var shouldAutomaticallyDismissModalController: Bool {
        return true
    }
    
    /// Returns *true* if the base view controller has modally presented view controller. Otherwise returns *false*.
    open var hasPresentedViewController: Bool {
        return (baseViewController.presentedViewController != nil)
    }

    // MARK: - RouterInterface
    /// Close currently active view animated. Override to change default behavior.
    /// By default dismiss modally presented child controller and router if presented.
    /// Otherwhise calls *closeCurrentView(animated:,completion:)* for parent router if exists.
    open func closeCurrentView() {
        closeCurrentView(animated: true)
    }
    
    /// Close currently active view. Override to change default behavior.
    /// By default dismiss modally presented child controller and router if presented.
    /// Otherwhise calls *closeCurrentView(animated:,completion:)* for parent router if exists.
    /// - parameter animated: indicates if closing process should be animated or not
    open func closeCurrentView(animated: Bool) {
        closeCurrentView(animated: animated, completion: nil)
    }

    /// Close currently active view. Override to change default behavior.
    /// By default dismiss modally presented child controller and router if presented.
    /// Otherwhise calls *closeCurrentView(animated:,completion:)* for parent router if exists.
    /// - parameter animated: indicates if closing process should be animated or not
    /// - parameter completion: the closure to execute after the closing finishes
    open func closeCurrentView(animated: Bool, completion: (()->Void)?) {
        if shouldAutomaticallyDismissModalController && hasPresentedViewController {
            let router = childRouters.first { baseViewController.presentedViewController == $0.baseViewController }
            if let modalRouter = router {
                dismissModalRouter(modalRouter)
            } else {
                baseViewController.dismiss(animated: animated, completion: completion)
            }
        } else if let parentRouter = parentRouter {
            parentRouter.closeCurrentView(animated: animated, completion: completion)
        } else {
            completion?()
        }
    }
}
