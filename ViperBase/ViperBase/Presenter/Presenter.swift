//
//  Presenter.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

/**
 Base class for all UX logic in VIPER arhitecture. In most cases views and presenters are connected one-to-one, but sometimes
 it's usefull to keep same UI with different UX logic.
 Your custom presenters may contain:
 - Strong references to any number of interactor interfaces
 - Strong references to custom service managers and services
 - Weak reference to custom router interface. User *'Interface segrigateion'* principle to design correct router interface.
 - Weak reference to one custom view interface
 */
open class Presenter: NSObject, PresenterInterface {
    /// Cast this interface to custom router interface to make methods calls to navigation
    open weak var routerInterface: RouterInterface?
    
    override public init() {
        // Empty
    }
    
    public init(router: RouterInterface? = nil) {
        routerInterface = router
    }
    
    /// Override this method to handle viewInterface property changes
    open func viewDidSetup() {
        // Does nothing
    }
    
    // MARK: - PresenterInterface
    
    /// Cast this interface to custom view interface to make methods calls to navigation
    open weak var viewInterface: ViewInterface? {
        didSet {
            viewDidSetup()
        }
    }

    /// Override this method to add basic setup view logic
    open func viewDidLoad() {
        // Does nothing
    }
    
    /// Override this method to handle view appearance *before* view will become visible on screen
    /// - parameter animated: is appearance will be animated
    open func viewWillAppear(animated: Bool) {
        // Does nothing
    }
    
    /// Override this method to handle view appearance *after* view did become visible on screen
    /// - parameter animated: is appearance was animated
    open func viewDidAppear(animated: Bool) {
        // Does nothing
    }
    
    /// Override this method to handle view disappearance *before* view will become hidden
    /// - parameter animated: is disappearance will be animated
    open func viewWillDisappear(animated: Bool) {
        // Does nothing
    }
    
    /// Override this method to handle view disappearance *after* view did become hidden
    /// - parameter animated: is disappearance was animated
    open func viewDidDisappear(animated: Bool) {
        // Does nothing
    }
}

