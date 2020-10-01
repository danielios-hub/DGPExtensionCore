//
//  ViewExtension.swift
//  SocialGaming
//
//  Created by Daniel Gallego Peralta on 12/03/2020.
//  Copyright © 2020 Daniel Gallego Peralta. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    fileprivate struct ViewTag {
        static var tagKey = "key"
    }
    
    /// For UITableView, you can save an Int section in the UIView
    public var mySection : Int? {
        set  {
            if let value = newValue {
                objc_setAssociatedObject(self, &ViewTag.tagKey, value as AnyObject, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
        
        get {
            return objc_getAssociatedObject(self, &ViewTag.tagKey) as? Int
        }
    }
    
    
    public typealias DGPCompletionBlock = () -> Void
    
    
    /// Animate the view to  alpha = 1
    /// - Parameter duration: The duration of the animation
    public func fadeIn(_ duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        })
    }
    
    
    /// Animate the view to be transparent and call a completion block in the end
    /// - Parameters:
    ///   - duration: the duration of the animation
    ///   - block: An optional block to be call
    public func fadeOut(_ duration: TimeInterval, block: DGPCompletionBlock?) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
            }, completion: { (state) in
                if state {
                    block?()
                }
        })
    }
    
    
    /// Load a view from and xib file name the same as the view
    /// - Returns: the view loaded from the xib
    open class func fromNib<T: UIView>(bundleID: String? = nil) -> T {
        if let bundleID = bundleID,
            let bundle = Bundle(identifier: bundleID) {
            return bundle.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
        } else {
            return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
        }
    }
    
    /// Apply a bottom border to the UITextField
    /// - Parameter color: The UIColor of the border
    public func addBottomBorder(color: UIColor = UIColor.darkGray, width: CGFloat = 1) {
        let border = CALayer()
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.bounds.height - width, width: self.bounds.width, height: width)
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    /// Remove first sublayer of the UITextView
    /// - Warning: You need to have a sublayer added first
    public func removeBorder() {
        self.layer.sublayers?.first?.removeFromSuperlayer()
    }
    
    /// Change the color of the first sublayer
    /// - Parameter color: The UIColor of the sublayer to be applied
    public func changeColorBottomLayer(color : UIColor) {
        self.layer.sublayers?.first?.borderColor = color.cgColor
    }

}
