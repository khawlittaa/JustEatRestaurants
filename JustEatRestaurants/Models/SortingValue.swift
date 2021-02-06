//
//  SortingValue.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 6/2/2021.
//

import Foundation

struct SortingValue: Decodable {
    var bestMatch: Double
    var newest: Double
    var ratingAverage: Double
    var distance: Int
    var popularity: Double
    var averageProductPrice: Int
    var deliveryCosts: Int
    var minCost: Int
    
}
