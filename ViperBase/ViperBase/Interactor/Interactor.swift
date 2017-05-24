//
//  Interactor.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

/**
 Base class for all business logic in VIPER arhitecture. Split your application business sogic to separate
 **use cases** and put each use case to single interactor. Try to follow 'Single Responsibility' design principle
 during develping you business logic (interactors) layer.
 Your custom interactors may contain strong references to:
 - Data managers (or other instances) that can load and store business models
 - Data sessions - objects that hold mutable application state
 - Other interactors (if it really nesessary)
 */
open class Interactor: NSObject, InteractorInterface {
    // Empty
}
