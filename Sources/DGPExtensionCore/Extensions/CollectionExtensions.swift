//
//  CollectionExtensions.swift
//  DGPExtensionCore
//
//  Created by Daniel Gallego Peralta on 7/3/21.
//

import Foundation

extension RangeReplaceableCollection  {
    /// Returns a new collection containing this collection shuffled
    var shuffled: Self {
        var elements = self
        return elements.shuffleInPlace()
    }
    /// Shuffles this collection in place
    @discardableResult
    mutating func shuffleInPlace() -> Self  {
        indices.forEach {
            let subSequence = self[$0...$0]
            let index = indices.randomElement()!
            replaceSubrange($0...$0, with: self[index...index])
            replaceSubrange(index...index, with: subSequence)
        }
        return self
    }
    func choose(_ n: Int) -> SubSequence { return shuffled.prefix(n) }
}
