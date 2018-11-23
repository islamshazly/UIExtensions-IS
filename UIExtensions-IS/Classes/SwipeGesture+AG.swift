//
//  SwipeGesture+AG.swift
//  
//
//  Created by islam Elshazly on 8/29/18.
//
import UIKit

open class SwipeGesture: UISwipeGestureRecognizer {
    
    private var swipeAction: ((UISwipeGestureRecognizer) -> Void)?
    public var fingerCount: Int = 1 {
        didSet {
            numberOfTouchesRequired = fingerCount
        }
    }
    public var swipedirection: UISwipeGestureRecognizer.Direction = .down {
        didSet {
            self.direction = swipedirection
        }
    }
    
    public override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
    }
    
    public convenience init (
        direction: UISwipeGestureRecognizer.Direction,
        fingerCount: Int = 1,
        action: ((UISwipeGestureRecognizer) -> Void)?) {
        self.init()
        self.direction = direction
        numberOfTouchesRequired = fingerCount
        swipeAction = action
        addTarget(self, action: #selector(SwipeGesture.didSwipe(_:)))
    }
    
    @objc open func didSwipe (_ swipe: UISwipeGestureRecognizer) {
        swipeAction? (swipe)
    }
}
