//
//  ApplicationRouter.swift
//  ViperBase-Sample
//
//  Created by SOL on 04.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

final class ApplicationRouter: ContainerRouter {
    let applicationAssembly: ApplicationAssemblyInterface
    
    init(applicationAssembly: ApplicationAssemblyInterface) {
        self.applicationAssembly = applicationAssembly
    }
    
    override open func loadContainerViewController() {
        super.loadContainerViewController()
        
        contentRouter = applicationAssembly.newsFeedRouter()
    }
}

// MARK: - ApplicationRouterInterface
extension ApplicationRouter: ApplicationRouterInterface {
    // Empty
}
