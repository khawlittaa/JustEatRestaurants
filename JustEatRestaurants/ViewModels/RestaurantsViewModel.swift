//
//  RestaurantsViewModel.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 6/2/2021.
//

import Foundation

class RestaurantsViewModel: ObservableObject {
    
    @Published private var favorites: Set<String>
    
    init() {
        let savedValues = UserDefaults.standard.stringArray(forKey: "Favorites") ?? []
        favorites = Set(savedValues)
        
        guard let url = Bundle.main.url(forResource: "restaurants", withExtension: "json") else {
            fatalError("Can't locate locations.json in the app bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Can't load restaurants.json from the app bundle.")
        }

        guard let decoded = try? JSONDecoder().decode([Restaurant].self, from: data) else {
            fatalError("Can't decode restaurants.json from the app bundle.")
        }
    }
}
