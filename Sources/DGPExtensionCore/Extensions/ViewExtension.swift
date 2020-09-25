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
    
    func clipWithRadius(value: CGFloat = 8) {
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.layer.cornerRadius = value
    }
    
    typealias FinalBlock = () -> Void
    
    func fadeIn(_ duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        })
    }
    
    func fadeOut(_ duration: TimeInterval, block: FinalBlock?) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
            }, completion: { (state) in
                if state {
                    if let block = block {
                        block()
                    }
                }
        })
    }
    
    
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    func setBottomBorder(with color: UIColor, width: CGFloat = 1) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.bounds.height - width, width: self.bounds.width, height: width)
        self.layer.addSublayer(border)
    }

}
