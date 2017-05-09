//
//  UserRegistrationDataManagerInterface.swift
//  ViperBase-Sample
//
//  Created by SOL on 08.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

struct UserRegistrationResult {
    let token: String
}

protocol UserRegistrationDataManagerInterface: NSObjectProtocol {
    func registerUser(registrationInfo: UserRegistrationInfo,
                      success: ((UserRegistrationResult)->Void)?,
                      failure: ((Error)->Void)?)
}
