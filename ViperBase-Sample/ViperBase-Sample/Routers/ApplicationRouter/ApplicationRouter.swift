//
//  ApplicationRouter.swift
//  ViperBase-Sample
//
//  Created by SOL on 04.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

final class ApplicationRouter: TabRouter {
    let applicationAssembly: ApplicationAssemblyInterface
    
    init(applicationAssembly: ApplicationAssemblyInterface) {
        self.applicationAssembly = applicationAssembly
    }
    
    override open func loadTabBarController() {
        super.loadTabBarController()
        
        let newsFeedRouter = applicationAssembly.newsFeedRouter()
        newsFeedRouter.baseViewController.tabBarItem.title = "News"
        
        let profileRouter = applicationAssembly.profileRouter()
        profileRouter.baseViewController.tabBarItem.title = "Profile"
        
        tabBarController.viewControllers = [newsFeedRouter.baseViewController,
                                            profileRouter.baseViewController]
        addChild(router: newsFeedRouter)
        addChild(router: profileRouter)
    }
}

// MARK: - ApplicationRouterInterface
extension ApplicationRouter: ApplicationRouterInterface {
    // Empty
}
