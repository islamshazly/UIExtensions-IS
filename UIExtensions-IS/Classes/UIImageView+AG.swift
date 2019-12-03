//
//  UIImageView+AG.swift
//  AG-UIExtensions
//
//  Created by islam Elshazly on 8/27/18.
//

import UIKit
import Kingfisher

// MARK: - properties

public extension UIImageView {
    
    var widthPixel : Int {
        get {
            return Int(self.image!.scale * self.image!.size.width)
        }
    }
    var hieghtPixel : Int {
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
    
    
    func showLoadingOnImage (){
        self.kf.indicatorType = .activity
    }
    
    func changeImageColorTint(_ color : UIColor) {
        self.image = self.image!.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
    
    func imageFromURL(fromURL url : String, placeHolder : UIImage?) {
        self.kf.setImage(with: URL(string: url), placeholder: placeHolder, options: [.cacheOriginalImage]) { (result: Result<RetrieveImageResult, KingfisherError>) in
            switch result {
            case .success(_):
                break
            case .failure(_):
                break
            }
        }
    }
    
    func imageFromURL(fromURL url : String, placeHolder : UIImage?, completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) {
        self.kf.setImage(with: URL(string: url), placeholder: placeHolder, options: [.cacheOriginalImage]) { (resultHandler: Result<RetrieveImageResult, KingfisherError>) in
            guard completionHandler != nil else { return }
            
            switch resultHandler {
            case .success(let image):
                completionHandler!(.success(image))
            case .failure(let error):
                completionHandler!(.failure(error))
            }
        }
    }
    
    func blur(withStyle style: UIBlurEffect.Style = .light) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        addSubview(blurEffectView)
        clipsToBounds = true
    }
    
    func blurred(withStyle style: UIBlurEffect.Style = .light) -> UIImageView {
        let imgView = self
        imgView.blur(withStyle: style)
        return imgView
    }
}
