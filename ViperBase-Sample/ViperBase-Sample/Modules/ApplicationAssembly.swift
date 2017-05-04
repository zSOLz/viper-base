//
//  ApplicationAssembly.swift
//  ViperBase-Sample
//
//  Created by SOL on 04.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

final class ApplicationAssembly: NSObject {
    /// One instance of this router will be assigned to all presenters inside current module.
    /// 'Weak' specifier was used to break retain cycle: View > Presenter > Router > View.
    fileprivate weak var innerApplicationRouter: ApplicationRouter?
    
    func applicationRouter() -> ApplicationRouter {
        if let applicationRouter = innerApplicationRouter {
            return applicationRouter
        } else {
            let router = ApplicationRouter(applicationAssembly: self)
            innerApplicationRouter = router
            return router
        }
    }
    
    func newsFeedAssembly() -> NewsFeedAssembly {
        return NewsFeedAssembly()
    }
}

// MARK: - ApplicationAssemblyInterface
extension ApplicationAssembly: ApplicationAssemblyInterface {
    func newsFeedRouter() -> NewsFeedRouter {
        return newsFeedAssembly().newsFeedRouter()
    }
}
