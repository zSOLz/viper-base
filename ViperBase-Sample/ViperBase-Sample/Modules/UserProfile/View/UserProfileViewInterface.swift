//
//  UserProfileViewInterface.swift
//  ViperBase-Sample
//
//  Created by SOL on 09.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

struct UserProfileViewModel {
    let username: String
    let email: String
    let token: String
}

protocol UserProfileViewInterface: ViewInterface {
    func setup(viewModel: UserProfileViewModel)
}
