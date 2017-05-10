//
//  PresenterTest.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import XCTest
@testable import ViperBase

fileprivate class ViewMock: NSObject, ViewInterface {
    // Empty
}

fileprivate class RouterMock: NSObject, RouterInterface {
    func closeCurrentView(animated: Bool, completion: (()->())?) {}
    func closeCurrentView(animated: Bool) {}
    func closeCurrentView() {}
}

class PresenterTest: XCTestCase {
    var presenter: PresenterSubclassMock!
    var presenterInterface: PresenterInterface {
        return presenter
    }
    
    override func setUp() {
        super.setUp()
        
        presenter = PresenterSubclassMock()
    }
    
    override func tearDown() {
        presenter = nil
        
        super.tearDown()
    }
    
    func testViewInterfaceAssigning() {
        var viewDidSetupCalled = false
        
        presenter.viewDidSetupCallback = {
            viewDidSetupCalled = true
        }
        
        let view = ViewMock()
        presenterInterface.viewInterface = view
        
        XCTAssertTrue(presenterInterface.viewInterface === view)
        XCTAssertTrue(viewDidSetupCalled)
    }
    
    func testViewInterfaceWeakReference() {
        presenter.viewDidSetupCallback = {}
        
        autoreleasepool {
            presenterInterface.viewInterface = ViewMock()
        }
        
        XCTAssertNil(presenterInterface.viewInterface)
    }
    
    func testRouterInterfaceAsignin() {
        let router = RouterMock()
        presenter.routerInterface = router
        
        XCTAssertTrue(presenter.routerInterface === router)
    }

    func testRouterInterfaceWeakReference() {
        autoreleasepool {
            presenter.routerInterface = RouterMock()
        }
        
        XCTAssertNil(presenter.routerInterface)
    }
    
    func testViewDidLoadMethodCall() {
        var viewDidLoadCalled = false
        
        presenter.viewDidLoadCallback = {
            viewDidLoadCalled = true
        }
        
        presenterInterface.viewDidLoad()
        
        XCTAssertTrue(viewDidLoadCalled)
    }

    func testViewWillAppearMethodCall() {
        var viewWillAppearCalled = false
        var animatedParam: Bool? = nil
        
        presenter.viewWillAppearCallback = { animated in
            viewWillAppearCalled = true
            animatedParam = animated
        }

        presenterInterface.viewWillAppear(animated: true)
        
        XCTAssertTrue(viewWillAppearCalled)
        XCTAssertTrue(animatedParam!)

        viewWillAppearCalled = false
        presenterInterface.viewWillAppear(animated: false)
        
        XCTAssertTrue(viewWillAppearCalled)
        XCTAssertFalse(animatedParam!)
    }
    
    func testViewDidAppearMethodCall() {
        var viewDidAppearCalled = false
        var animatedParam: Bool? = nil
        
        presenter.viewDidAppearCallback = { animated in
            viewDidAppearCalled = true
            animatedParam = animated
        }
        
        presenterInterface.viewDidAppear(animated: true)
        
        XCTAssertTrue(viewDidAppearCalled)
        XCTAssertTrue(animatedParam!)
        
        viewDidAppearCalled = false
        presenterInterface.viewDidAppear(animated: false)
        
        XCTAssertTrue(viewDidAppearCalled)
        XCTAssertFalse(animatedParam!)
    }
    
    func testViewWillDisappearMethodCall() {
        var viewWillDisappearCalled = false
        var animatedParam: Bool? = nil
        
        presenter.viewWillDisappearCallback = { animated in
            viewWillDisappearCalled = true
            animatedParam = animated
        }
        
        presenterInterface.viewWillDisappear(animated: true)
        
        XCTAssertTrue(viewWillDisappearCalled)
        XCTAssertTrue(animatedParam!)
        
        viewWillDisappearCalled = false
        presenterInterface.viewWillDisappear(animated: false)
        
        XCTAssertTrue(viewWillDisappearCalled)
        XCTAssertFalse(animatedParam!)
    }
    
    func testViewDidDisappearMethodCall() {
        var viewDidDisappearCalled = false
        var animatedParam: Bool? = nil
        
        presenter.viewDidDisappearCallback = { animated in
            viewDidDisappearCalled = true
            animatedParam = animated
        }
        
        presenterInterface.viewDidDisappear(animated: true)
        
        XCTAssertTrue(viewDidDisappearCalled)
        XCTAssertTrue(animatedParam!)
        
        viewDidDisappearCalled = false
        presenterInterface.viewDidDisappear(animated: false)
        
        XCTAssertTrue(viewDidDisappearCalled)
        XCTAssertFalse(animatedParam!)
    }
}
