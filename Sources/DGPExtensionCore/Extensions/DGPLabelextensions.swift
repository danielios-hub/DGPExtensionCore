//
//  Labelextensions.swift
//  SocialGaming
//
//  Created by Daniel Gallego Peralta on 03/04/2020.
//  Copyright © 2020 Daniel Gallego Peralta. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    /// Check if the UILabel cant show full text with the current font and frame size or it need to break the text
    /// - Returns: A bool value indicating the result
    public func isTruncated() -> Bool {
        if let string = self.text {
            let fontAttr = self.font != nil ? [NSAttributedString.Key.font : self.font!] : [:]
            let size = (string as NSString).boundingRect(with: CGSize(width: self.frame.size.width,
                                                                      height: CGFloat(Float.greatestFiniteMagnitude)),
                                                         options: .usesLineFragmentOrigin, attributes: fontAttr,
                                                         context: nil).size
            return size.height > self.bounds.size.height
        } else {
            return false
        }
    }
    
    /// Add an underline to the text as an attributed text to the label
    public func underLine() {
        if let textUnwrapped = self.text{
            let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
            let underlineAttributedString = NSAttributedString(string: textUnwrapped, attributes: underlineAttribute)
            self.attributedText = underlineAttributedString
        }
    }
}
