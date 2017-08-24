//
//  RouterInterface.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

/**
 The base interface for all routing (navigation) logic classes in VIPER arhitecture.
 Custom router interfaces should specify set of methods to navigate between screens.
*/
public protocol RouterInterface: NSObjectProtocol {
    /// Call this method to close current screen
    func closeCurrentView()

    /// Call this method to close current screen
    /// - parameter animated: indicates if closing process should be animated or not
    func closeCurrentView(animated: Bool)
    
    /// Call this method to close current screen
    /// - parameter animated: indicates if closing process should be animated or not
    /// - parameter completion: the closure to execute after the closing finishes
    func closeCurrentView(animated: Bool, completion: (()->Void)?)
}
