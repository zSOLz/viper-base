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
    let token: String
    let email: String
}

protocol UserProfileViewInterface: ViewInterface {
    func setup(viewModel: UserProfileViewModel)
}
