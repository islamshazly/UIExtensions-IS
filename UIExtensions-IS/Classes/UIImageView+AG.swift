//
//  UIImageView+AG.swift
//  AG-UIExtensions
//
//  Created by islam Elshazly on 8/27/18.
//

import UIKit

// MARK: - properties

public extension UIImageView {
    
    public var widthPixel : Int {
        get {
            return Int(self.image!.scale * self.image!.size.width)
        }
    }
    public var hieghtPixel : Int {
        get {
            return Int(self.image!.scale * self.image!.size.height)
        }
    }
    @IBInspectable var imageTint: UIColor {
        get {
            return tintColor
        }
        set {
            self.image = self.image!.withRenderingMode(.alwaysTemplate)
            self.tintColor = newValue
        }
    }
}

// MARK: - Methods

public extension UIImageView {
    
    
    public func showLoadingOnImage (){
        self.kf.indicatorType = .activity
    }
    
    public func changeImageColorTint(_ color : UIColor) {
        self.image = self.image!.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
    
    public func imageFromURL(fromURL url : String, placeHolder : UIImage?) {
        self.kf.setImage(with: URL(string: url), placeholder: placeHolder , options: [.cacheOriginalImage], progressBlock: { (recivedSize,size) in
        }, completionHandler: nil)
    }
    
    public func imageFromURL(fromURL url : String, placeHolder : UIImage?, handler: @escaping  ((_ error : Error?) -> ())) {
        self.kf.setImage(with: URL(string: url), placeholder: placeHolder , options: [.cacheOriginalImage], progressBlock: { (recivedSize,size) in
        }, completionHandler: {
            (image, error, cashType, url) in
            handler(error)
        })
    }
    
    public func blur(withStyle style: UIBlurEffect.Style = .light) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        addSubview(blurEffectView)
        clipsToBounds = true
    }
    
    public func blurred(withStyle style: UIBlurEffect.Style = .light) -> UIImageView {
        let imgView = self
        imgView.blur(withStyle: style)
        return imgView
    }
}
