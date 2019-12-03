import UIKit

// MARK: - IBInspectable

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var circuler: Bool {
        get {
            return self.circuler
        }
        set {
            layer.cornerRadius = layer.cornerRadius / 2
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return self.borderColor
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

// MARK: - Properties

extension UIView {
    
    public enum BorderSide {
        case top
        case left
        case bottom
        case right
    }
    
    public var endX: CGFloat {
        return frame.origin.x + frame.width
    }
    
    public var endY: CGFloat {
        return frame.origin.y + frame.height
    }
    
    public var startX: CGFloat {
        return frame.origin.x
    }
    
    public var startY: CGFloat {
        return frame.origin.y
    }
    
    public var width: CGFloat {
        get {
            return frame.width
        } set(value) {
            self.frame.size = CGSize(width: value, height: height)
        }
    }
    
    public var height: CGFloat {
        get {
            return frame.height
        } set(value) {
            self.frame.size = CGSize(width: width, height: value)
        }
    }
}

// MARK: - Methods

extension UIView {
    
    public func startX(x : CGFloat) {
        self.frame.origin.x = x
    }
    
    public func startY( y : CGFloat) {
        self.frame.origin.y = y
    }
    
    public func center(x : CGFloat, y : CGFloat) {
        self.center = CGPoint(x: x, y: y)
    }
    
    public func centerX(x: CGFloat) {
        self.center = CGPoint(x: x, y: self.centerY())
    }
    
    public func centerX() -> CGFloat {
        return self.center.x
    }
    
    public func centerY(y : CGFloat)  {
        self.center = CGPoint(x : self.centerX(), y : y)
    }
    
    public func centerY() -> CGFloat {
        return self.center.y
    }
    
    public func loadNibFile(){
        let bundle = Bundle(for: self.classForCoder)
        let view = UINib.init(nibName: String(describing: type(of: self)), bundle: bundle).instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        self.addSubview(view)
    }
    
    public func removeSubviews() {
        subviews.forEach({ $0.removeFromSuperview() })
    }
    
}

// MARK: - UI Methods

extension UIView {
    
    public func dim() {
        self.alpha = 0.5
    }
    
    public func unDim() {
        self.alpha = 1
    }
    
    public func applyBorder(_ color: UIColor) {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = color.cgColor
    }
    
    public func applyCornerRadius(corenrRadius : CGFloat , mask : Bool) {
        self.layer.masksToBounds = mask
        self.layer.cornerRadius = corenrRadius
    }
    
    public func applyBottomBorder(_ color: UIColor) {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = color.cgColor
    }
    
    public func addBorder(forSide side: BorderSide, withColor color: UIColor, borderWidth: CGFloat = 1) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        
        switch side {
        case .top:
            border.frame = CGRect(x: 0,
                                  y: 0,
                                  width: self.width,
                                  height: borderWidth)
        case .left:
            border.frame = CGRect(x: 0,
                                  y: 0,
                                  width: borderWidth,
                                  height: self.height)
        case .bottom:
            border.frame = CGRect(x: 0,
                                  y: self.height - borderWidth,
                                  width: self.width,
                                  height: borderWidth)
        case .right:
            border.frame = CGRect(x: self.width - borderWidth,
                                  y: 0,
                                  width: borderWidth,
                                  height: self.height)
        }
        self.layer.addSublayer(border)
    }
    
    
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    public func drawStroke(width: CGFloat, color: UIColor) {
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.width, height: self.width), cornerRadius: self.width/2)
        let shapeLayer = CAShapeLayer ()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = width
        self.layer.addSublayer(shapeLayer)
    }
    
}

// MARK: Transform Extensions

private let CATransform3DM34: CGFloat = 1.0 / -1000.0

extension UIView {
    
    public func setRotationX(_ x: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = CATransform3DM34
        transform = CATransform3DRotate(transform, x.degreesToRadians, 1.0, 0.0, 0.0)
        self.layer.transform = transform
    }
    
    public func setRotationY(_ y: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = CATransform3DM34
        transform = CATransform3DRotate(transform, y.degreesToRadians, 0.0, 1.0, 0.0)
        self.layer.transform = transform
    }
    
    public func setRotationZ(_ z: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = CATransform3DM34
        transform = CATransform3DRotate(transform, z.degreesToRadians, 0.0, 0.0, 1.0)
        self.layer.transform = transform
    }
    
    public func setRotation(x: CGFloat, y: CGFloat, z: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = CATransform3DM34
        transform = CATransform3DRotate(transform, x.degreesToRadians, 1.0, 0.0, 0.0)
        transform = CATransform3DRotate(transform, y.degreesToRadians, 0.0, 1.0, 0.0)
        transform = CATransform3DRotate(transform, z.degreesToRadians, 0.0, 0.0, 1.0)
        self.layer.transform = transform
    }
    
    public func setScale(x: CGFloat, y: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = CATransform3DM34
        transform = CATransform3DScale(transform, x, y, 1)
        self.layer.transform = transform
    }
    
}

// MARK: - Animations

private let UIViewAnimationDuration: TimeInterval = 1
private let UIViewAnimationSpringDamping: CGFloat = 0.5
private let UIViewAnimationSpringVelocity: CGFloat = 0.5

private let UIViewAnimationDurationPop: TimeInterval = 0.2
private let UIViewAnimationScalePop: CGFloat = 1.1

private let UIViewAnimationDurationPopBig: TimeInterval = 0.2
private let UIViewAnimationScalePopBig: CGFloat = 1.25

private let UIViewAnimationDurationReversePop: TimeInterval = 0.05
private let UIViewAnimationScaleReversePop: CGFloat = 0.0

private let UIViewAnimationScaleOriginal: CGFloat = 1.0

public extension UIView {
    
    func spring(animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
        spring(duration: UIViewAnimationDuration, animations: animations, completion: completion)
    }
    
    func spring(duration: TimeInterval, animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
        UIView.animate(
            withDuration: UIViewAnimationDuration,
            delay: 0,
            usingSpringWithDamping: UIViewAnimationSpringDamping,
            initialSpringVelocity: UIViewAnimationSpringVelocity,
            options: UIView.AnimationOptions.allowAnimatedContent,
            animations: animations,
            completion: completion
        )
    }
    
    func fadeIn(duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
        if isHidden {
            isHidden = false
        }
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
        if isHidden {
            isHidden = false
        }
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        }, completion: completion)
    }
    
    func pop() {
        setScale(x: UIViewAnimationScalePop, y: UIViewAnimationScalePop)
        spring(duration: UIViewAnimationDurationPop, animations: { [unowned self] () -> Void in
            self.setScale(x: UIViewAnimationScaleOriginal, y: UIViewAnimationScaleOriginal)
        })
    }
    
    func popBig() {
        setScale(x: UIViewAnimationScalePopBig, y: UIViewAnimationScalePopBig)
        spring(duration: UIViewAnimationDurationPopBig, animations: { [unowned self] () -> Void in
            self.setScale(x: UIViewAnimationScaleOriginal, y: UIViewAnimationScaleOriginal)
        })
    }
    
    func reversePop() {
        setScale(x: UIViewAnimationScaleReversePop, y: UIViewAnimationScaleReversePop)
        UIView.animate(withDuration: UIViewAnimationDurationReversePop, delay: 0, options: .allowUserInteraction, animations: {[weak self] in
            self?.setScale(x: UIViewAnimationScaleOriginal, y: UIViewAnimationScaleOriginal)
            }, completion: { (_) in })
    }
    
}

// MARK: - Gesture

public extension UIView {
    
    func addTapGesture(tapNumber: Int = 1, action: ((UITapGestureRecognizer) -> Void)?) {
        let tap = TapGesture(tapCount: tapNumber, fingerCount: 1, action: action)
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    
    func addSwipeGesture(direction: UISwipeGestureRecognizer.Direction, fingerCount: Int = 1, action: ((UISwipeGestureRecognizer) -> Void)?) {
        let tap = SwipeGesture(direction: direction,fingerCount: fingerCount, action: action)
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    
    func addLongPressGesture(_ action: ((UILongPressGestureRecognizer) -> Void)?) {
        let longPressGesture = LongPressGesture(action: action)
        addGestureRecognizer(longPressGesture)
        isUserInteractionEnabled = true
    }
}

extension UIView {
    
    func shadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func shadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
