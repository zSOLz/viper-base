//
//  PresentableTalbeViewCell.swift
//  ViperBase
//
//  Created by SOL on 6/27/17.
//  Copyright © 2017 SOL. All rights reserved.
//

import UIKit

open class PresentableTalbeViewCell: UITableViewCell, ViewInterface, ContentContainerInterface {
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupContent()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        setupContent()
    }
    
    open var presenterInterface: PresenterInterface? {
        didSet {
            if let presenter = presenterInterface {
                presenter.viewInterface = self
                presenter.viewDidLoad()
                if self.superview != nil {
                    presenter.viewWillAppear(animated: false)
                    presenter.viewDidAppear(animated: false)
                }
            }
        }
    }
    
    override open func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        
        if newWindow != nil {
            presenterInterface?.viewWillAppear(animated: false)
        } else {
            presenterInterface?.viewWillDisappear(animated: false)
        }
    }
    
    override open func didMoveToWindow() {
        super.didMoveToWindow()
        
        if window != nil {
            presenterInterface?.viewDidAppear(animated: false)
        } else {
            presenterInterface?.viewDidDisappear(animated: false)
        }
    }
    
    // MARK: - ContentContainerInterface
    
    dynamic open func setupContent() {
        // Does nothing
    }
}
