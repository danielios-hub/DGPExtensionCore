//
//  ErrorExtensions.swift
//  SocialGaming
//
//  Created by Daniel Gallego Peralta on 22/08/2020.
//  Copyright © 2020 Daniel Gallego Peralta. All rights reserved.
//

import Foundation

extension Error {
    
    /// Convert to NSError to return the error code
    public var code: Int { return (self as NSError).code }
    
    /// convert to NSError to return domain
    public var domain: String { return (self as NSError).domain }
}
