//
//  ArticleDetailsInteractorInterface.swift
//  ViperBase-Sample
//
//  Created by SOL on 03.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

protocol ArticleDetailsInteractorInterface: InteractorInterface {
    var title: String { get }
    var authorName: String { get }
    var imageName: String? { get }
    var text: String { get }
}
