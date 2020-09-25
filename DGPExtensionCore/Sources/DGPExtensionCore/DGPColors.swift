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
    
    static let emerald = UIColor(hex: 0x009B77)
    static let emeraldDark = UIColor(hex: 0x2D7F77)
    
    static let lightGray = UIColor(hex: 0xecf0f1)
    static let silver = UIColor(hex: 0xbdc3c7)
    
    static let mimosa = UIColor(hex: 0xEFC050)
    
    static let transparentBlack = UIColor(hex: 0x000000, a: 0.5)
    static let black_midnight_light = UIColor(hex: 0x404040)
    
    static let red_fluorescent = UIColor(hex: 0xff5252)
    static let gray_light_dusty = UIColor(hex: 0xE9E9E9)
    
    // Create a UIColor from RGB
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    // Create a UIColor from a hex value (E.g 0x000000)
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
        )
    }
    
    
    func createImageFromUIColor() -> UIImage {
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
