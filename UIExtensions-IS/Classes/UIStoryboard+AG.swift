//
//  UIStoryBoard+AG.swift
//  AG-UIExtensions
//
//  Created by islam Elshazly on 8/27/18.
//

import UIKit

// MARK: - Methods
public extension UIStoryboard {
    
    public static var main: UIStoryboard? {
        let bundle = Bundle.main
        guard let name = bundle.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String else { return nil }
        return UIStoryboard(name: name, bundle: bundle)
    }

    public func instantiateViewController<T: UIViewController>(withClass name: T.Type) -> T? {
        return instantiateViewController(withIdentifier: String(describing: name)) as? T
    }
}
