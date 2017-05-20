//
//  PresenterMock.swift
//  ViperBase
//
//  Created by SOL on 10.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import XCTest
@testable import ViperBase

final class PresenterMock: NSObject, PresenterInterface {
    var setViewInterfaceCallback: ((ViewInterface?)->Void)!
    var getViewInterfaceCallback: (()->ViewInterface?)!
    
    var viewDidLoadCallback: (()->Void)!
    var viewWillAppearCallback: ((Bool)->Void)!
    var viewDidAppearCallback: ((Bool)->Void)!
    var viewWillDisappearCallback: ((Bool)->Void)!
    var viewDidDisappearCallback: ((Bool)->Void)!
    
    var viewInterface: ViewInterface? {
        get {
            return getViewInterfaceCallback()
        }
        set {
            setViewInterfaceCallback(newValue)
        }
    }
    
    func viewDidLoad() {
        viewDidLoadCallback()
    }
    
    func viewWillAppear(animated: Bool) {
        viewWillAppearCallback(animated)
    }
    
    func viewDidAppear(animated: Bool) {
        viewDidAppearCallback(animated)
    }
    
    func viewWillDisappear(animated: Bool) {
        viewWillDisappearCallback(animated)
    }
    
    func viewDidDisappear(animated: Bool) {
        viewDidDisappearCallback(animated)
    }
}
