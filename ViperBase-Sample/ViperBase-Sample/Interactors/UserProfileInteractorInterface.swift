//
//  UserProfileInteractorInterface.swift
//  ViperBase-Sample
//
//  Created by SOL on 08.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

protocol UserProfileInteractorInterface: InteractorInterface {
    var isUserAuthenticated: Bool { get }
    
    var username: String { get }
    var email: String { get }
}
