//
//  ExtensionTableViewCell.swift
//  SocialGaming
//
//  Created by Daniel Gallego Peralta on 29/08/2020.
//  Copyright © 2020 Daniel Gallego Peralta. All rights reserved.
//

import UIKit 

extension UITableViewCell {
    
    /// Get the name class as string
    /// - Returns: String with the name class
    public static func getIdentifier() -> String {
        return String(describing: self)
    }
}
