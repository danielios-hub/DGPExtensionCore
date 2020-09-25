//
//  DoubleExtensions.swift
//  SocialGaming
//
//  Created by Daniel Gallego Peralta on 03/04/2020.
//  Copyright © 2020 Daniel Gallego Peralta. All rights reserved.
//

import Foundation

extension Double {
    
    /// Round an integer to a specific number of decimals
    /// - Parameter places: numbers of decimals to show
    /// - Returns: A Double rounded
    public func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(self * divisor) / divisor
    }
}
