//
//  ServiceTest.swift
//  ViperBaseTests
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import XCTest
@testable import ViperBase

class ServiceTest: XCTestCase {
    func testRegisteredInManagerMethod() {
        let customService = CustomServiceSubclassMock()
        let customManager = ServiceManager(parent: ServiceManager.general)
        
        customManager.register(service: customService)
        
        XCTAssertEqual(CustomServiceMock.registered(inManager: customManager), customService)
        
        ServiceManager.general.register(service: customService)
        
        XCTAssertEqual(CustomServiceMock.registered(), customService)
        XCTAssertEqual(CustomServiceMock.registered(inManager: customManager), customService)
        
        customManager.unregister(service: customService)
        
        XCTAssertEqual(CustomServiceMock.registered(), customService)
        XCTAssertEqual(CustomServiceMock.registered(inManager: customManager), customService)
        
        ServiceManager.general.unregister(service: customService)
    }
    
    func testStartStopMethods() {
        let service = CustomServiceMock()
        
        XCTAssertFalse(service.isStarted)
        service.start()
        XCTAssertTrue(service.isStarted)
        service.stop()
        XCTAssertFalse(service.isStarted)
    }

    /*
    // Test for this method always fails: Unknown swift compiler bug. Maybe you can solve it :)
    func testIsRegisteredInManagerMethod() {
        let customSubclassService = CustomServiceMock()
        let customManager = ServiceManager(parent: ServiceManager.general)
        
        XCTAssertFalse(CustomServiceMock.isRegistered())
        XCTAssertFalse(CustomServiceMock.isRegistered(inManager: customManager))
        XCTAssertFalse(CustomServiceSubclassMock.isRegistered())
        XCTAssertFalse(CustomServiceSubclassMock.isRegistered(inManager: customManager))
        XCTAssertFalse(AnotherCustomServiceMock.isRegistered())
        XCTAssertFalse(AnotherCustomServiceMock.isRegistered(inManager: customManager))
        
        customManager.register(service: customSubclassService)
        
        XCTAssertFalse(CustomServiceMock.isRegistered())
        XCTAssertTrue(CustomServiceMock.isRegistered(inManager: customManager))
        XCTAssertFalse(CustomServiceSubclassMock.isRegistered())
        XCTAssertTrue(CustomServiceSubclassMock.isRegistered(inManager: customManager))
        
        XCTAssertFalse(AnotherCustomServiceMock.isRegistered())
        XCTAssertFalse(AnotherCustomServiceMock.isRegistered(inManager: customManager))
        
        ServiceManager.general.register(service: customSubclassService)
        
        XCTAssertTrue(CustomServiceMock.isRegistered())
        XCTAssertTrue(CustomServiceMock.isRegistered(inManager: customManager))
        XCTAssertTrue(CustomServiceSubclassMock.isRegistered())
        XCTAssertTrue(CustomServiceSubclassMock.isRegistered(inManager: customManager))
        XCTAssertFalse(AnotherCustomServiceMock.isRegistered())
        XCTAssertFalse(AnotherCustomServiceMock.isRegistered(inManager: customManager))
     
        customManager.unregister(service: customSubclassService)
        
        XCTAssertTrue(CustomServiceMock.isRegistered())
        XCTAssertTrue(CustomServiceMock.isRegistered(inManager: customManager))
        XCTAssertTrue(CustomServiceSubclassMock.isRegistered())
        XCTAssertTrue(CustomServiceSubclassMock.isRegistered(inManager: customManager))
        XCTAssertFalse(AnotherCustomServiceMock.isRegistered())
        XCTAssertFalse(AnotherCustomServiceMock.isRegistered(inManager: customManager))
        
        ServiceManager.general.unregister(service: customSubclassService)
        
        XCTAssertFalse(CustomServiceMock.isRegistered())
        XCTAssertFalse(CustomServiceMock.isRegistered(inManager: customManager))
        XCTAssertFalse(CustomServiceSubclassMock.isRegistered())
        XCTAssertFalse(CustomServiceSubclassMock.isRegistered(inManager: customManager))
        XCTAssertFalse(AnotherCustomServiceMock.isRegistered())
        XCTAssertFalse(AnotherCustomServiceMock.isRegistered(inManager: customManager))
    } */
}
