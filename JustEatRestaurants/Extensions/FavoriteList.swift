//
//  FavoriteList.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 8/2/2021.
//

import Foundation
import Combine

// define key for observing
extension UserDefaults {
    @objc dynamic var favorites: [String] {
        get { stringArray(forKey: "Favorites") ?? [] }
        set { setValue(newValue, forKey: "Favorites") }
    }
}

func isfavorite(_ restaurant: Restaurant) -> Bool{
    if UserDefaults.standard.favorites.count > 0{
     return   UserDefaults.standard.favorites.contains(restaurant.name)
    }else{
      return  false
    }
}

func addFavorite(_ restaurant: Restaurant){
    UserDefaults.standard.favorites.append(restaurant.name)
}

func removeFavorite(_ restaurant: Restaurant){
    UserDefaults.standard.favorites.removeAll(where: { $0 ==  restaurant.name})
}

func toggleFavorite(_ restaurant: Restaurant){
    if isfavorite(restaurant){
        removeFavorite(restaurant)
    }else{
        addFavorite(restaurant)
    }
}
