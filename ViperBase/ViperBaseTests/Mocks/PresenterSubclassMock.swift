//
//  PresenterSubclassMock.swift
//  ViperBaseTests
//
//  Created by SOL on 10.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import XCTest
@testable import ViperBase

class PresenterSubclassMock: Presenter {
    var viewDidSetupCallback: (()->Void)!
    var viewDidLoadCallback: (()->Void)!
    
    var viewWillAppearCallback: ((Bool)->Void)!
    var viewDidAppearCallback: ((Bool)->Void)!
    var viewWillDisappearCallback: ((Bool)->Void)!
    var viewDidDisappearCallback: ((Bool)->Void)!
    
    open override func viewDidSetup() {
        viewDidSetupCallback()
    }
    
    override open func viewDidLoad() {
        viewDidLoadCallback()
    }
    
    open override func viewWillAppear(animated: Bool) {
        viewWillAppearCallback(animated)
    }
    
    open override func viewDidAppear(animated: Bool) {
        viewDidAppearCallback(animated)
    }
    
    open override func viewWillDisappear(animated: Bool) {
        viewWillDisappearCallback(animated)
    }
    
    open override func viewDidDisappear(animated: Bool) {
        viewDidDisappearCallback(animated)
    }
}
