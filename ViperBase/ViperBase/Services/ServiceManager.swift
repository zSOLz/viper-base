//
//  ServiceManager.swift
//  ViperBase
//
//  Created by SOL on 02.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

/**
 The class allows to keep services that should be accessible in public in all over the app.
 Basicaly this class implements singleton pattern. Use it carefully.
 Use child services as containers for the content scope specific services.
 */
open class ServiceManager: NSObject {
    /// Returns the singleton service manager instance
    open static let general = ServiceManager()

    /// Returns the link to parent service manager. Always nil for base manager and not-nil for all child services.
    open fileprivate(set) weak var parent: ServiceManager?

    /// Array of all registered services in the current service manager
    open fileprivate(set) var registeredServices = [Service]()
    
    /// Simple init is not allowed. Use init(parent:)
    fileprivate override init() {
        // Does nothing
    }
    
    /// Init new service manager with it's parent.
    /// Be carefully: looping is not allowed and does not handling yet.
    /// - 
    public init(parent: ServiceManager) {
        super.init()
        
        self.parent = parent
    }
    
    /// Register new service. Registration of multiple services with the same type are not allowed as well as registration of child service of previously registered.
    /// Use child service managers to register services with the same type.
    /// You can use registered(serviceWithType:) to get access to previously registered service.
    /// - parameter service: the service to register in current manager
    open func register<ServiceType: Service>(service: ServiceType) {
        if let registeresService = registered(serviceWithType: ServiceType.self) {
            assertionFailure("ViperBase.ServiceManager.register(service:)\n" +
                "Manager already contains service with type <\(String(describing:type(of:registeresService)))>\n" +
                "Registration of multiple services with the same or inherited type gives unpredictable result.")
        }
        registeredServices.append(service)
        service.start()
    }
    
    /// Remove service with given type if it was registered before.
    /// - parameter service: the service to remove from already registerde services
    open func unregister<ServiceType: Service>(service: ServiceType) {
        if let index = registeredServices.index(of: service) {
            registeredServices.remove(at: index)
            service.stop()
        }
    }
    
    /// Returns already registered service with the given type or nil.
    /// In case service with the given type was not registered in current service manager, the manager will try to get requested service from it's parent.
    /// - parameter serviceWithType: type of the previously registered service
    open func registered<ServiceType: Service>(serviceWithType type: ServiceType.Type) -> ServiceType? {
        for service in registeredServices {
            if let serviceToFind = service as? ServiceType {
                return serviceToFind
            }
        }
        return parent?.registered(serviceWithType: ServiceType.self)
    }
}
