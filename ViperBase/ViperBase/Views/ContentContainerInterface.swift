//
//  ContentContainerInterface.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

/**
 Helper interface. Provides single entry point for interface customisations.
 Preferred to use this interface when you create your own UI control or component.
 */
public protocol ContentContainerInterface: NSObjectProtocol {
    /// Call this method once immediately after your control will be created.
    /// Override it in child classes to keep single place to set up custom content of your classes.
    func setupContent()
}
