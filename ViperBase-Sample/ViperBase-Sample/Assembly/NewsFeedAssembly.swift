//
//  NewsFeedAssembly.swift
//  ViperBase-Sample
//
//  Created by SOL on 03.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

final class NewsFeedAssembly: NSObject, NewsFeedAssemblyInterface {
    // One instance of this router will be assigned to all presenters inside current module.
    // 'Weak' specifier was used to break retain cycle: View > Presenter > Router > View.
    fileprivate weak var internalNewsFeedRouter: NewsFeedRouter?
    
    func newsFeedRouter() -> NewsFeedRouter {
        if let newsFeedRouter = internalNewsFeedRouter {
            return newsFeedRouter
        } else {
            let router = NewsFeedRouter(newsFeedAssembly: self)
            internalNewsFeedRouter = router
            return router
        }
    }
    
    // MARK: - NewsFeedAssemblyInterface
    
    func newsFeedViewController() -> NewsFeedViewController {
        fatalError()
    }
    
    func articleDetailsViewController() -> ArticleDetailsViewController {
        fatalError()
    }
}
