//
//  ServiceManager.swift
//  ViperBase
//
//  Created by SOL on 02.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

open class ServiceManager: NSObject {
    open static let general = ServiceManager()

    open fileprivate(set) weak var parent: ServiceManager?
    open fileprivate(set) var registeredServices = [Service]()
    
    fileprivate override init() {
        // Does nothing
    }
    
    public init(parent: ServiceManager) {
        super.init()
        
        self.parent = parent
    }
    
    open func register<ServiceType: Service>(service: ServiceType) {
        if let registeresService = registered(serviceWithType: ServiceType.self) {
            assertionFailure("ViperBase.ServiceManager.register(service:)\n" +
                "Manager already contains service with type <\(String(describing:type(of:registeresService)))>\n" +
                "Registration of multiple services with the same or inherited type gives unpredictable result.")
        }
        registeredServices.append(service)
        service.start()
    }
    
    open func unregister<ServiceType: Service>(service: ServiceType) {
        if let index = registeredServices.index(of: service) {
            registeredServices.remove(at: index)
            service.stop()
        }
    }
    
    open func registered<ServiceType: Service>(serviceWithType type: ServiceType.Type) -> ServiceType? {
        for service in registeredServices {
            if let serviceToFind = service as? ServiceType {
                return serviceToFind
            }
        }
        return parent?.registered(serviceWithType: ServiceType.self)
    }
}
