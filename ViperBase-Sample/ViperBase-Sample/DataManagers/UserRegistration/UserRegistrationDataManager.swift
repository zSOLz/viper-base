//
//  UserRegistrationDataManager.swift
//  ViperBase-Sample
//
//  Created by SOL on 08.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import ViperBase

final class UserRegistrationDataManager: NSObject {
    // Empty
}

// MARK: - UserRegistrationDataManagerInterface
extension UserRegistrationDataManager: UserRegistrationDataManagerInterface {
    func registerUser(registrationInfo: UserRegistrationInfo,
                      success: ((UserRegistrationResult)->Void)?,
                      failure: ((Error)->Void)?) {
        // Simulate internet delay
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
            let token = UUID().uuidString // Get random token string as server response
            let result = UserRegistrationResult(token: token)
            
            // Call success copmlete data loading
            success?(result)
        }
    }
}
