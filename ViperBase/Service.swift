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
        return currentManager.registered(serviceWithType: self)!
    }
    
    open fileprivate(set) var isStarted = false
    
    open func start() {
        isStarted = true
    }
    
    open func stop() {
        isStarted = false
    }
}
