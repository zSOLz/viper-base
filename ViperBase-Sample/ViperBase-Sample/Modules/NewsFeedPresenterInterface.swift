//
//  NewsFeedPresenterInterface.swift
//  ViperBase-Sample
//
//  Created by SOL on 03.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

struct NewsFeedArticleViewModel {
    let title: String
    let image: UIImage?
    let author: String
}

protocol NewsFeedPresenterInterface: PresenterInterface {
    var numberOfArticles: Int { get }
    func articleViewModel(at index: Int) -> NewsFeedArticleViewModel
    
    func articleTapped(at index: Int)
}
