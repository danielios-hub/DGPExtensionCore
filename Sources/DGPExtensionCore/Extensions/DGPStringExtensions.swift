//
//  StringExtensions.swift
//  SocialGaming
//
//  Created by Daniel Gallego Peralta on 11/03/2020.
//  Copyright © 2020 Daniel Gallego Peralta. All rights reserved.
//

import Foundation

extension String {
    
    
    /// use the string as key for the localized String file and get the localized String
    public var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    
    /// remove all spaces at the end of the String
    /// - Returns: The same String without any spaces in the end
    public func trimming() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    
    /// Check if the String is empty
    /// - Returns: A Bool value indicating if is empty or not
    public func isBlank() -> Bool {
        return self == ""
    }
}
