//
//  NewsFeedRouter.swift
//  ViperBase-Sample
//
//  Created by SOL on 03.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

final class NewsFeedRouter: StackRouter, NewsFeedRouterInterface {
    let storyboard = UIStoryboard(name: "NewsFeed", bundle: nil)
    let newsFeedAssembly: NewsFeedAssemblyInterface
    
    init(newsFeedAssembly: NewsFeedAssemblyInterface) {
        self.newsFeedAssembly = newsFeedAssembly
    }
    
    override open func loadNavigationController() {
        navigationController = storyboard.instantiateInitialViewController() as! PresentableNavigationController
    }
    
    // MARK: - NewsFeedRouterInterface
    
    func showArticleDetails(with articleId: NewsFeedArticle.Id) {
        activeViewController?.performSegue(withIdentifier: "", configuratoin: { segue in
            return false
        })
    }
}
