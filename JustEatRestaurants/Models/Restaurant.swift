//
//  Restaurant.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 6/2/2021.
//

import Foundation
struct Restaurant: Decodable, Identifiable {
    let id = UUID()
    var name: String
    var status: String
    var sortingValues: SortingValue
}

struct RestaurantsData: Decodable {
    var restaurants: [Restaurant]
}
