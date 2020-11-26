//
//  Extentions.swift
//  LoopNewMediaGMBH
//
//  Created by BenyaminMokhtarpour on 9/20/20.
//  Copyright © 2020 Benyamin Mokhtarpour. All rights reserved.
//

import Foundation
import  UIKit

extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }

    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}

extension UIView {
    
    // add mask to view
    public func addMaskView(on hid: @escaping () -> ()) {
        let maskingView = UIView(frame: self.bounds)
        maskingView.accessibilityIdentifier = "maskingViewId"
        maskingView.backgroundColor = .clear
        maskingView.addTapGestureRecognizer(action: { [weak self] in
            guard let `self` = self else {return}
            self.hideMaskView()
            hid()
        })
        self.addSubview(maskingView)
        maskingView.fillToSuperView()
        UIView.animate(withDuration: 0.2, animations: {
            maskingView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        })
    }
    
    func hideMaskView() {
        self.subviews.forEach { (subview) in
            if subview.accessibilityIdentifier == "maskingViewId" {
                UIView.animate(withDuration: 0.2, animations: {
                    subview.backgroundColor = .clear
                }) { (_) in
                    subview.removeFromSuperview()
                }
            }
        }
    }
    
    // src : https://medium.com/@sdrzn/adding-gesture-recognizers-with-closures-instead-of-selectors-9fb3e09a8f0b
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    // Set our computed property type to a closure
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    // This is the meat of the sauce, here we create the tap gesture recognizer and
    // store the closure the user passed to us in the associated object we declared above
    public func addTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // Every time the user taps on the UIImageView, this function gets called,
    // which triggers the closure we stored
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        } else {
            print("no action")
        }
    }
    
    func fillToSuperView(){
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }
    
    
    
}

extension UIFont {
    
    enum FontWeight {
        case ultraLight
        case light
        case regular
        case medium
        case bold
    }

    class func LNMFonticon(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: "iGap_fontico", size: fontSize)!
    }
}
extension UIView{
    func rotateAnimation(number: Int) {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 1)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float(number)
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    func hoveraAnimation() {
        let hover = CABasicAnimation(keyPath: "position")
            
        hover.isAdditive = true
        hover.fromValue = NSValue(cgPoint: CGPoint.zero)
        hover.toValue = NSValue(cgPoint: CGPoint(x: 0.0, y: 5.0))
        hover.autoreverses = true
        hover.duration = 2
        hover.repeatCount = Float.infinity
            
        self.layer.add(hover, forKey: "myHoverAnimation")

    }
}
