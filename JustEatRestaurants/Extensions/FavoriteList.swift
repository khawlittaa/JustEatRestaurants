//
//  FavoriteList.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 8/2/2021.
//

import Foundation


let favoriteRestaurants = UserDefaults.standard.stringArray(forKey: "Favorites") ?? []
var favorites: [String] = favoriteRestaurants

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
