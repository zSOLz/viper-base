//
//  Service.swift
//  ViperBase
//
//  Created by SOL on 02.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

open class Service: NSObject {
    class func registered(inManager manager: ServiceManager? = nil) -> Self {
        let currentManager = manager ?? ServiceManager.general
        guard let service = currentManager.registered(serviceWithType: self) else {
            fatalError("ViperBase.Service.registered(inManager:)\n" +
                "Could not find service with type: \(type(of: self)) in service manager: <\(currentManager)>")
        }
        return service
    }
    
    /*
    * Test for this method always fails: Unknown swift compiler bug. Use it on your own risk.
    * See commented test in ServiceTest.testIsRegisteredInManagerMethod(). Maybe you can solve this bug :)
    */
    class func isRegistered(inManager manager: ServiceManager? = nil) -> Bool {
        let currentManager = manager ?? ServiceManager.general
        let service = currentManager.registered(serviceWithType: self)
        return (service != nil)
    }
    
    open fileprivate(set) var isStarted = false
    
    open func start() {
        isStarted = true
    }
    
    open func stop() {
        isStarted = false
    }
}
