//
//  NewsFeedArticle.swift
//  ViperBase-Sample
//
//  Created by SOL on 03.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

struct NewsFeedArticle {
    typealias Id = String
    
    let articleId: Id
    let title: String
    let authorName: String
    let image: UIImage?
    let text: String
}
