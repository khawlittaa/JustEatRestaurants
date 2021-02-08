//
//  RestaurantsViewModel.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 6/2/2021.
//

import Foundation

class RestaurantsViewModel: ObservableObject {
    
    @Published var restaurants: [Restaurant]
    
    init() {
        
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
    
    func reorderBypriority(){
        restaurants = reorderRestaurants()
    }
    
  private  func reorderRestaurants() -> [Restaurant] {
        let defaultOrder = ["open", "order ahead", "closed"]

        return restaurants.sorted { (res1taurant1, restaurant2) -> Bool in
//            if both restaurants are favorite  or not favorite sort by status
            if isfavorite(res1taurant1) == isfavorite(restaurant2){
                if let first = defaultOrder.index(of: res1taurant1.status), let second = defaultOrder.index(of: restaurant2.status) {
                    return first < second
                }
                return false
            }else{
               return isfavorite(res1taurant1) && !isfavorite(restaurant2)
            }
        }
    }
    
    func filterResturantsByName(searchname: String){
        restaurants =  restaurants.filter({$0.name.lowercased().contains(searchname.lowercased())})
    }
    
}
