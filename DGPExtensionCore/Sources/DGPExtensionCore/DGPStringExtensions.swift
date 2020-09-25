//
//  StringExtensions.swift
//  SocialGaming
//
//  Created by Daniel Gallego Peralta on 11/03/2020.
//  Copyright © 2020 Daniel Gallego Peralta. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    func trimming() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func isBlank() -> Bool {
        return self == ""
    }
}
