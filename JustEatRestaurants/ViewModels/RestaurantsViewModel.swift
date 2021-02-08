//
//  RestaurantsViewModel.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 6/2/2021.
//

import Foundation

class RestaurantsViewModel: ObservableObject {
    
    @Published var favorites: [String]
    @Published var restaurants: [Restaurant]
    
    init() {
        let savedValues = UserDefaults.standard.stringArray(forKey: "Favorites") ?? []
        favorites = savedValues
        
        guard let url = Bundle.main.url(forResource: "restaurants", withExtension: "json") else {
            fatalError("Can't locate locations.json in the app bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Can't load restaurants.json from the app bundle.")
        }

        guard let decoded = try? JSONDecoder().decode(RestaurantsData.self, from: data) else {
            fatalError("Can't decode restaurants.json from the app bundle.")
        }
        
        restaurants = decoded.restaurants
    }
    
    func isfavorite(_ restaurant: Restaurant) -> Bool{
        favorites.contains(restaurant.name)
    }
    
    func addFavorite(_ restaurant: Restaurant){
        favorites.append(restaurant.name)
        UserDefaults.standard.set(Array(favorites), forKey: "Favorites")
    }
    
    func removeFavorite(_ restaurant: Restaurant){
        favorites = favorites.filter{$0 != restaurant.name}
        UserDefaults.standard.set(Array(favorites), forKey: "Favorites")
    }
    
    func toggleFavorite(_ restaurant: Restaurant){
        if isfavorite(restaurant){
            removeFavorite(restaurant)
        }else{
            addFavorite(restaurant)
        }
    }
}
