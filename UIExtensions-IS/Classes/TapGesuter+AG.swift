//
//  TapGesuter+AG.swift
//  
//
//  Created by islam Elshazly on 8/29/18.
//

import UIKit

open class TapGesture: UITapGestureRecognizer {
    
    private var tapAction: ((UITapGestureRecognizer) -> Void)?
    public var tapCount: Int = 1 {
        didSet {
            self.numberOfTapsRequired = tapCount
        }
    }
    public var fingerCount: Int = 1 {
        didSet {
            self.numberOfTouchesRequired = fingerCount
        }
    }
    public override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }
    
    public convenience init (
        tapCount: Int = 1,
        fingerCount: Int = 1,
        action: ((UITapGestureRecognizer) -> Void)?) {
        self.init()
        self.numberOfTapsRequired = tapCount
        self.numberOfTouchesRequired = fingerCount
        self.tapAction = action
        self.addTarget(self, action: #selector(TapGesture.didTap(_:)))
    }
    
    @objc open func didTap (_ tap: UITapGestureRecognizer) {
        tapAction? (tap)
    }
}
