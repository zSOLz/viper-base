//
//  Presenter.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

/**
 The Base class for the UX logic in VIPER arhitecture. In most cases views and presenters are connected one-to-one, but sometimes
 it's usefull to keep the same UI with a different UX logic.
 Custom presenters may contain:
 - Strong references to any number of interactor interfaces
 - Strong references to custom service managers and services
 - A weak reference to a custom router interface. Follow the *'Interface segregation'* principle to design correct router interfaces.
 - A weak reference to one custom view interface
 */
open class Presenter: NSObject, PresenterInterface {
    /// Cast this interface to a custom router interface to make methods calls to a navigation
    open weak var routerInterface: RouterInterface?
    
    override public init() {
        // Empty
    }
    
    public init(router: RouterInterface? = nil) {
        routerInterface = router
    }
    
    /// Override this method to handle viewInterface property changes
    open func viewDidSetup() {
        // Does nothing by default
    }
    
    // MARK: - PresenterInterface
    
    /// Cast this interface to a custom view interface to make methods calls to a view
    open weak var viewInterface: ViewInterface? {
        didSet {
            viewDidSetup()
        }
    }

    /// Override this method to add basic setup view logic
    open func viewDidLoad() {
        // Does nothing by default
    }
    
    /// Override this method to handle the view appearance *before* it becomes visible on the screen
    /// - parameter animated: if appearance will be animated
    open func viewWillAppear(animated: Bool) {
        // Does nothing by default
    }
    
    /// Override this method to handle the view appearance *after* it has become visible on the screen
    /// - parameter animated: if appearance was animated
    open func viewDidAppear(animated: Bool) {
        // Does nothing by default
    }
    
    /// Override this method to handle the view disappearance *before* it becomes hidden
    /// - parameter animated: if disappearance will be animated
    open func viewWillDisappear(animated: Bool) {
        // Does nothing by default
    }
    
    /// Override this method to handle the view disappearance *after* it has become hidden
    /// - parameter animated: if disappearance was animated
    open func viewDidDisappear(animated: Bool) {
        // Does nothing by default
    }
}

