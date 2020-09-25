//
//  Colors.swift
//  SocialGaming
//
//  Created by Daniel Gallego Peralta on 11/03/2020.
//  Copyright © 2020 Daniel Gallego Peralta. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /// Create a UIImage with a size of 1x1 with the color
    /// - Returns: the UIImage with a color applied an size 1x1
    public func createImageFromUIColor() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let contextRef: CGContext = UIGraphicsGetCurrentContext()!
        contextRef.setFillColor(self.cgColor)
        contextRef.fill(rect)
        let img: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return img
    }
}
