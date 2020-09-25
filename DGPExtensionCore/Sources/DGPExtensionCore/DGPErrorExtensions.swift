//
//  ErrorExtensions.swift
//  SocialGaming
//
//  Created by Daniel Gallego Peralta on 22/08/2020.
//  Copyright © 2020 Daniel Gallego Peralta. All rights reserved.
//

import Foundation

extension Error {
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}
