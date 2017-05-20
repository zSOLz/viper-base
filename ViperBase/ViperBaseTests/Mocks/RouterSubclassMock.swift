//
//  RouterSubclassMock.swift
//  ViperBase
//
//  Created by SOL on 10.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import XCTest
@testable import ViperBase

class RouterSubclassMock: Router {
    var getBaseViewControllerClosure: (()->UIViewController)!
    var getActiveViewControllerClosure: (()->UIViewController)!
    var getShouldAutomaticallyDismissModalControllerClosure: (()->Bool)!
    var getHasPresentedViewControllerClosure: (()->Bool)!
    
    override open var baseViewController: UIViewController {
        return getBaseViewControllerClosure()
    }
    
    override open var activeViewController: UIViewController? {
        return getActiveViewControllerClosure()
    }

    override open var shouldAutomaticallyDismissModalController: Bool {
        return getShouldAutomaticallyDismissModalControllerClosure()
    }
    
    override open var hasPresentedViewController: Bool {
        return getHasPresentedViewControllerClosure()
    }
}
