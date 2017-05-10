//
//  PresentableViewControllerTest.swift
//  ViperBaseTests
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import XCTest
@testable import ViperBase

class PresentableViewControllerTest: XCTestCase {    
    func testPresentableViewControllerLyfeCycle() {
        var viewInterfaceCalledObject: ViewInterface!
        var viewDidLoadCalled = false
        var viewWillAppearCalled = false
        var viewDidAppearCalled = false
        var viewWillDisappearCalled = false
        var viewDidDisappearCalled = false
        
        // Setup presenter interface check case
        let presenterMock = PresenterMock()
        presenterMock.setViewInterfaceCallback = { viewInterface in
            viewInterfaceCalledObject = viewInterface
        }
        
        let viewController = PresentableViewController()
        viewController.presenterInterface = presenterMock
        
        XCTAssertTrue(viewController === viewInterfaceCalledObject)
        
        presenterMock.setViewInterfaceCallback = nil
        
        // View appear check
        presenterMock.viewDidLoadCallback = {
            viewDidLoadCalled = true
        }
        
        presenterMock.viewWillAppearCallback = { animated in
            viewWillAppearCalled = true
            XCTAssertFalse(animated)
        }
        
        presenterMock.viewDidAppearCallback = { animated in
            viewDidAppearCalled = true
            XCTAssertFalse(animated)
        }
        
        let window = UIWindow()
        window.rootViewController = viewController
        window.addSubview(viewController.view)
        
        XCTAssertTrue(viewDidLoadCalled)
        XCTAssertTrue(viewWillAppearCalled)
        XCTAssertTrue(viewDidAppearCalled)
        
        presenterMock.viewDidLoadCallback = nil
        presenterMock.viewWillAppearCallback = nil
        presenterMock.viewDidAppearCallback = nil
        
        // View disappear check
        presenterMock.viewWillDisappearCallback = { animated in
            viewWillDisappearCalled = true
            XCTAssertFalse(animated)
        }
        
        presenterMock.viewDidDisappearCallback = { animated in
            viewDidDisappearCalled = true
            XCTAssertFalse(animated)
        }
        
        window.rootViewController = nil
        
        XCTAssertTrue(viewWillDisappearCalled)
        XCTAssertTrue(viewDidDisappearCalled)
        
        presenterMock.viewWillDisappearCallback = nil
        presenterMock.viewDidDisappearCallback = nil
    }
    
    func testVisiblePresentableViewControllerLyfeCycle() {
        var viewInterfaceCalledObject: ViewInterface!
        var viewDidLoadCalled = false
        var viewWillAppearCalled = false
        var viewDidAppearCalled = false
        
        let presenterMock = PresenterMock()
        presenterMock.setViewInterfaceCallback = { viewInterface in
            viewInterfaceCalledObject = viewInterface
        }
        
        presenterMock.viewDidLoadCallback = {
            viewDidLoadCalled = true
        }
        
        presenterMock.viewWillAppearCallback = { animated in
            viewWillAppearCalled = true
            XCTAssertFalse(animated)
        }
        
        presenterMock.viewDidAppearCallback = { animated in
            viewDidAppearCalled = true
            XCTAssertFalse(animated)
        }
        
        let viewController = PresentableViewController()
        let window = UIWindow()
        window.rootViewController = viewController
        window.addSubview(viewController.view)
        
        viewController.presenterInterface = presenterMock
        
        XCTAssertTrue(viewController === viewInterfaceCalledObject)
        XCTAssertTrue(viewDidLoadCalled)
        XCTAssertTrue(viewWillAppearCalled)
        XCTAssertTrue(viewDidAppearCalled)
        
        viewController.presenterInterface = nil
    }
}
