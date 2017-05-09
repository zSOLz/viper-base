//
//  KeyboardSizeObserver.swift
//  ViperBase-Sample
//
//  Created by SOL on 09.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

class KeyboardHeightObserver {
    var heightChangedClosure: ((CGFloat)->Void)?
    
    init() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(KeyboardHeightObserver.keyboardWillChangeSize(_:)),
                                               name: .UIKeyboardWillChangeFrame,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(KeyboardHeightObserver.keyboardWillHide(_:)),
                                               name: .UIKeyboardWillHide,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(KeyboardHeightObserver.keyboardWillShow(_:)),
                                               name: .UIKeyboardWillShow,
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

fileprivate extension KeyboardHeightObserver {
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let frame = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        heightChangedClosure?(frame.size.height)
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        heightChangedClosure?(0)
    }

    @objc func keyboardWillChangeSize(_ notification: NSNotification) {
        guard let frame = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        heightChangedClosure?(frame.size.height)
    }

}
