//
//  Service.swift
//  ViperBase
//
//  Created by SOL on 02.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

/**
 Base class for services.
 */
open class Service: NSObject {
    /// Returns already registered service with current type in the given manager.
    /// In case manager is nil, the general manager will be used.
    /// - parameter inManager: the possible container of the current service
    class open func registered(inManager manager: ServiceManager? = nil) -> Self {
        let currentManager = manager ?? ServiceManager.general
        guard let service = currentManager.registered(serviceWithType: self) else {
            fatalError("ViperBase.Service.registered(inManager:)\n" +
                "Could not find service with type: \(type(of: self)) in service manager: <\(currentManager)>")
        }
        return service
    }
    
    /// Returns true if service with current type was registered in the given manager.
    /// In case manager is nil, the general manager will be used.
    ///
    /// - Warning: Test for this method always fails: Unknown swift compiler bug. Use it on your own risk.
    /// See commented test in ServiceTest.testIsRegisteredInManagerMethod(). Maybe you can solve this bug :)
    /// - parameter inManager: the possible container of the current service
    class open func isRegistered(inManager manager: ServiceManager? = nil) -> Bool {
        let currentManager = manager ?? ServiceManager.general
        let service = currentManager.registered(serviceWithType: self)
        return (service != nil)
    }
    
    /// Returns true if service was started: added to service manager.
    open fileprivate(set) var isStarted = false
    
    /// Override this method to implement custom setup logic
    /// By default this method will be called by ServiceManager when the service becomes registered
    open func start() {
        isStarted = true
    }
    
    /// Override this method to implement custom shutdown logic
    /// By default this method will be called by ServiceManager when the service becomes unregistered
    open func stop() {
        isStarted = false
    }
}
