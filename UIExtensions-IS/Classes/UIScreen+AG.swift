//
//  UIScreen+AG.swift
//  
//
//  Created by islam Elshazly on 8/30/18.
//

import UIKit

public extension UIScreen {
    
    static var screenWidth: CGFloat {
        if UIApplication.shared.statusBarOrientation.isPortrait {
            return UIScreen.main.bounds.size.width
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
    
    static var screenHeight: CGFloat {
        if UIApplication.shared.statusBarOrientation.isPortrait {
            return UIScreen.main.bounds.size.height
        } else {
            return UIScreen.main.bounds.size.width
        }
    }
    
    static var screenHeightWithoutStatusBar: CGFloat {
        if UIApplication.shared.statusBarOrientation.isPortrait {
            return UIScreen.main.bounds.size.height - screenStatusBarHeight
        } else {
            return UIScreen.main.bounds.size.width - screenStatusBarHeight
        }
    }
    
    static var screenStatusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
}
