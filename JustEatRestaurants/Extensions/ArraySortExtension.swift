//
//  ArraySortExtension.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 8/2/2021.
//

import Foundation

extension Array where Element == Restaurant {

func reordebyStatus() -> [Restaurant] {

    let defaultOrder = ["open", "order ahead", "closed"]

    return self.sorted { (a, b) -> Bool in
        if let first = defaultOrder.index(of: a.status), let second = defaultOrder.index(of: b.status) {
            return first < second
        }
        return false
    }
}
}
