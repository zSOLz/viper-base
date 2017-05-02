//
//  RouterInterface.swift
//  ViperBase
//
//  Created by SOL on 28.04.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

public protocol RouterInterface: NSObjectProtocol {
    func closeCurrentView(animated: Bool, completion: (()->())?)
}
