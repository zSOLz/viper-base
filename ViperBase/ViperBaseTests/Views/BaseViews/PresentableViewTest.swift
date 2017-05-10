//
//  PresentableViewTest.swift
//  ViperBaseTests
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import XCTest
@testable import ViperBase

class PresentableViewSubclassMock: PresentableView {
    var isSetupContentCalled = false
    
    override func setupContent() {
        super.setupContent()
        
        isSetupContentCalled = true
    }
}

class PresentableViewTest: XCTestCase {
    func testPresentableViewLyfeCycle() {
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
        
        presenterMock.viewDidLoadCallback = {
            viewDidLoadCalled = true
        }
        
        let view = PresentableView()
        view.presenterInterface = presenterMock
        
        XCTAssertTrue(view === viewInterfaceCalledObject)
        XCTAssertTrue(viewDidLoadCalled)
        
        presenterMock.setViewInterfaceCallback = nil
        presenterMock.viewDidLoadCallback = nil
        
        // View appear check
        presenterMock.viewWillAppearCallback = { animated in
            viewWillAppearCalled = true
            XCTAssertFalse(animated)
        }

        presenterMock.viewDidAppearCallback = { animated in
            viewDidAppearCalled = true
            XCTAssertFalse(animated)
        }
        
        let window = UIWindow()
        let superview = UIView()
        window.addSubview(superview)
        superview.addSubview(view)
        
        XCTAssertTrue(viewWillAppearCalled)
        XCTAssertTrue(viewDidAppearCalled)
        
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
        
        view.removeFromSuperview()
        
        XCTAssertTrue(viewWillDisappearCalled)
        XCTAssertTrue(viewDidDisappearCalled)

        presenterMock.viewWillDisappearCallback = nil
        presenterMock.viewDidDisappearCallback = nil
    }
    
    func testVisiblePresentableViewLyfeCycle() {
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
        
        let view = PresentableView()
        let window = UIWindow()
        let superview = UIView()
        window.addSubview(superview)
        superview.addSubview(view)
        
        view.presenterInterface = presenterMock
        
        XCTAssertTrue(view === viewInterfaceCalledObject)
        XCTAssertTrue(viewDidLoadCalled)
        XCTAssertTrue(viewWillAppearCalled)
        XCTAssertTrue(viewDidAppearCalled)
        
        view.presenterInterface = nil
    }
    
    func testSetupContentMethodCall() {
        let view1 = PresentableViewSubclassMock()
        XCTAssertTrue(view1.isSetupContentCalled)
        
        let view2 = PresentableViewSubclassMock(frame: CGRect.zero)
        XCTAssertTrue(view2.isSetupContentCalled)

        let bundle = Bundle(for: PresentableViewSubclassMock.self)
        let items = bundle.loadNibNamed("PresentableViewSubclassMock", owner: nil)!
        let view3 = items.first as! PresentableViewSubclassMock
        XCTAssertTrue(view3.isSetupContentCalled)
    }
}
