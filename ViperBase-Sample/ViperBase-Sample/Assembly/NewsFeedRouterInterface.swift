//
//  NewsFeedRouterInterface.swift
//  ViperBase-Sample
//
//  Created by SOL on 03.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

protocol NewsFeedRouterInterface: RouterInterface {
    func showArticleDetails(with articleId: NewsFeedArticle.Id)
}
