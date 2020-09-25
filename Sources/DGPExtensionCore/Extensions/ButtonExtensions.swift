//
//  ButtonExtensions.swift
//  SocialGaming
//
//  Created by Daniel Gallego Peralta on 03/04/2020.
//  Copyright © 2020 Daniel Gallego Peralta. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    fileprivate struct ButtonTag {
        static var tagKey = "key"
    }
    
    var mySection : Int? {
        set  {
            if let value = newValue {
                objc_setAssociatedObject(self, &ButtonTag.tagKey, value as AnyObject, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
        
        get {
            return objc_getAssociatedObject(self, &ButtonTag.tagKey) as? Int
        }
    }
    
    func animate(){
        let defaultDuration = 2.0
        let defaultDamping = 0.50
        let defaultVelocity = 6.0
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: defaultDuration, delay: 0, usingSpringWithDamping: CGFloat(defaultDamping),
            initialSpringVelocity: CGFloat(defaultVelocity),
            options: UIView.AnimationOptions.allowUserInteraction,
            animations: {
                self.transform = CGAffineTransform.identity
            },
            completion: { finished in
                //done
            }
        )
    }
    
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
    }
}
