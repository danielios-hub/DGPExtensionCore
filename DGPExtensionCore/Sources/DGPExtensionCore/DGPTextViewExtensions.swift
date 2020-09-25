//
//  TextViewExtensions.swift
//  SocialGaming
//
//  Created by Daniel Gallego Peralta on 03/04/2020.
//  Copyright © 2020 Daniel Gallego Peralta. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    
    func isTruncated() -> Bool {
        if let string = self.text {
            let size = (string as NSString).boundingRect(with: CGSize(width: self.frame.size.width, height: CGFloat(Float.greatestFiniteMagnitude)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : self.font!], context: nil).size
            return size.height > self.bounds.size.height
        } else {
            return false
        }
    }
    
}
