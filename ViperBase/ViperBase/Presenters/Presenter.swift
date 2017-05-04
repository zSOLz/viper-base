//
//  Presenter.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

open class Presenter: NSObject, PresenterInterface {
    open weak var routerInterface: RouterInterface?
    
    public init(router: RouterInterface? = nil) {
        routerInterface = router
    }
    
    open func viewDidSetup() {
        // Does nothing
    }
    
    // MARK: - PresenterInterface
    
    open var viewInterface: ViewInterface? {
        didSet {
            viewDidSetup()
        }
    }

    open func viewDidLoad() {
        // Does nothing
    }
    
    open func viewWillAppear(animated: Bool) {
        // Does nothing
    }
    
    open func viewDidAppear(animated: Bool) {
        // Does nothing
    }
    
    open func viewWillDisappear(animated: Bool) {
        // Does nothing
    }
    
    open func viewDidDisappear(animated: Bool) {
        // Does nothing
    }
}

