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
        
        let accountViewController = UIViewController()
        accountViewController.view.backgroundColor = UIColor.white
        accountViewController.tabBarItem.title = "Account"
        
        tabBarController.viewControllers = [newsFeedRouter.baseViewController,
                                            accountViewController]
        addChild(router: newsFeedRouter)
    }
}

// MARK: - ApplicationRouterInterface
extension ApplicationRouter: ApplicationRouterInterface {
    // Empty
}
