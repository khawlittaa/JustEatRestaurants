//
//  RestaurantsViewModel.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 6/2/2021.
//

import Foundation

class RestaurantsViewModel: ObservableObject {
    
    @Published var restaurants: [Restaurant]
    @Published var sortingOptions: [SortOption]
    
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
        
        let sort1 = SortOption(type: .none, filterTitle: "All",isSelected: true)
        let sort2 = SortOption(type: .bestMatch, filterTitle: "best Match")
        let sort3 = SortOption(type: .deliveryCosts, filterTitle: "delivery Costs")
        let sort4 = SortOption(type: .distance, filterTitle: "distance")
        let sort5 = SortOption(type: .minimumCost, filterTitle: "minimum Cost")
        let sort6 = SortOption(type: .newest, filterTitle: "newest")
        let sort7 = SortOption(type: .popularity, filterTitle: "popularity")
        let sort8 = SortOption(type: .ratingAverage, filterTitle: "rating Average")
        let sort9 = SortOption(type: .averageProductPrice, filterTitle: "average Product Price")
        
        sortingOptions = [sort1, sort2, sort3, sort4, sort5, sort6, sort7, sort8, sort9]
        
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
