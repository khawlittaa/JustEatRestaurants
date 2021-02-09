//
//  SortOption.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 9/2/2021.
//

import Foundation

enum SortOptions:String,CaseIterable {
    case none = "none"
    case distance = "distance"
    case popularity = "poularity"
    case newest = "newest"
    case bestMatch = "best Match"
    case deliveryCosts = "delivery Costs"
    case minimumCost = "minimum Cost"
    case averageProductPrice = "average Product Price"
    case ratingAverage = "rating Average"
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
