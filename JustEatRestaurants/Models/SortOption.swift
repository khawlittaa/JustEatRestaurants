//
//  SortOption.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 9/2/2021.
//

import Foundation

enum SortOptions {
    case none
    case distance
    case popularity
    case newest
    case bestMatch
    case deliveryCosts
    case minimumCost
    case averageProductPrice
    case ratingAverage
}

class SortOption: Identifiable {
    var isSelected: Bool
    var type: SortOptions
    var filterTitle: String
    
    init(type: SortOptions, filterTitle: String, isSelected: Bool = false) {
        self.type = type
        self.filterTitle = filterTitle
        self.isSelected = isSelected
    }
}
