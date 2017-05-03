//
//  StoryboardHandler.swift
//  ViperBase
//
//  Created by SOL on 03.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import Foundation

public protocol StoryboardHandler: class {
    func performSegue(withIdentifier: String, configuratoin:((UIStoryboardSegue) -> Bool)?)
}

extension UIViewController: StoryboardHandler {
    public func performSegue(withIdentifier identifier: String, configuratoin:((UIStoryboardSegue) -> Bool)?) {
        performSegue(withIdentifier: identifier, sender: SegueInfo(configuration: configuratoin))
    }
    
    public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let info = sender as? SegueInfo {
            info.configuration?(segue)
        }
//        super.prepare(for: segue, sender: sender)
    }
}

public struct SegueInfo {
    var configuration: ((UIStoryboardSegue) -> Bool)?
}
