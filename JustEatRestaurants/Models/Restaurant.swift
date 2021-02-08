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
    
    static  let exemple = Restaurant(name: "Royal Thai", status: "order ahead", sortingValues: SortingValue(bestMatch: 0.0, newest: 96.0, ratingAverage: 4.5, distance: 1190, popularity: 17.0, averageProductPrice: 1536, deliveryCosts: 200, minCost: 1000))
}

struct RestaurantsData: Decodable {
    var restaurants: [Restaurant]
}
