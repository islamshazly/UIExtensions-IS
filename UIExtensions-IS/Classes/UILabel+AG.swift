//
//  UILabel+AG.swift
//  
//
//  Created by islam Elshazly on 8/29/18.
//

import Foundation

public extension UILabel {
    
    convenience init(font: UIFont, color: UIColor, alignment: NSTextAlignment) {
        self.init()
        self.font = font
        self.textColor = color
        self.textAlignment = alignment
    }
    
    func estimatedSize(_ width: CGFloat = CGFloat.greatestFiniteMagnitude, height: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGSize {
        return sizeThatFits(CGSize(width: width, height: height))
    }
    
    func estimatedHeight() -> CGFloat {
        return sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)).height
    }
    
    func estimatedWidth() -> CGFloat {
        return sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)).width
    }
    
    func fitHeight() {
        self.height = estimatedHeight()
    }
    
     func fitWidth() {
        self.width = estimatedWidth()
    }
    
     func fitSize() {
        self.fitWidth()
        self.fitHeight()
        sizeToFit()
    }
}
