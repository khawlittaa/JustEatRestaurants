//
//  RestaurantsViewModel.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 6/2/2021.
//

import Foundation
import Combine

class RestaurantsViewModel: ObservableObject {
    
    @Published  var restaurants: [Restaurant]{
        didSet {
            objectWillChange.send()
        }
    }
    @Published var sortingOptions: [SortOption]
    //    need to sync myfavorites with userDefault Value
    @Published var myFavorites: [String] = UserDefaults.standard.favorites{
        didSet {
            UserDefaults.standard.favorites = myFavorites
            reorderBypriority()
        }
    }
    
    private var cancelable: AnyCancellable?
    
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
        
        restaurants = decoded.restaurants.reorderRestaurants()
        
        let sort1 = SortOption(type: .none, filterTitle: "default",isSelected: true)
        let sort2 = SortOption(type: .bestMatch, filterTitle: "best Match")
        let sort3 = SortOption(type: .deliveryCosts, filterTitle: "delivery Costs")
        let sort4 = SortOption(type: .distance, filterTitle: "distance")
        let sort5 = SortOption(type: .minimumCost, filterTitle: "minimum Cost")
        let sort6 = SortOption(type: .newest, filterTitle: "newest")
        let sort7 = SortOption(type: .popularity, filterTitle: "popularity")
        let sort8 = SortOption(type: .ratingAverage, filterTitle: "rating Average")
        let sort9 = SortOption(type: .averageProductPrice, filterTitle: "average Product Price")
        
        sortingOptions = [sort1, sort2, sort3, sort4, sort5, sort6, sort7, sort8, sort9]
        
        cancelable = UserDefaults.standard.publisher(for: \.favorites)
            .sink(receiveValue: { [weak self] newValue in
                guard let self = self else { return }
                if newValue != self.myFavorites { // avoid cycling !!
                    self.myFavorites = newValue
                }
            })
        
    }
    
    
    func reorderBypriority(){
        restaurants = restaurants.reorderRestaurants()
        objectWillChange.send()
    }
    
    func sortbyDistance() -> [Restaurant]{
        return  restaurants.sorted { (rest1, rest2) -> Bool in
            return   rest1.sortingValues.distance < rest2.sortingValues.distance
        }
    }
    
    func sortbyPopularity() -> [Restaurant]{
        return  restaurants.sorted { (rest1, rest2) -> Bool in
            return   rest1.sortingValues.popularity > rest2.sortingValues.popularity
        }
    }
    
    func sortbyNewest() -> [Restaurant]{
        return  restaurants.sorted { (rest1, rest2) -> Bool in
            return   rest1.sortingValues.newest > rest2.sortingValues.newest
        }
    }
    
    func sortbyBestMatch() -> [Restaurant]{
        return  restaurants.sorted { (rest1, rest2) -> Bool in
            return   rest1.sortingValues.bestMatch > rest2.sortingValues.bestMatch
        }
    }
    
    func sortbydeliveryCosts() -> [Restaurant]{
        return  restaurants.sorted { (rest1, rest2) -> Bool in
            return   rest1.sortingValues.deliveryCosts < rest2.sortingValues.deliveryCosts
        }
    }
    
    func sortbyMinimumCost() -> [Restaurant]{
        return  restaurants.sorted { (rest1, rest2) -> Bool in
            return   rest1.sortingValues.minCost < rest2.sortingValues.minCost
        }
    }
    
    func sortbyAverageProductPrice() -> [Restaurant]{
        return  restaurants.sorted { (rest1, rest2) -> Bool in
            return   rest1.sortingValues.averageProductPrice < rest2.sortingValues.averageProductPrice
        }
    }
    
    func sortbyRatingAverage() -> [Restaurant]{
        return  restaurants.sorted { (rest1, rest2) -> Bool in
            return   rest1.sortingValues.ratingAverage > rest2.sortingValues.ratingAverage
        }
    }
    
    private  func selecSortingValue(index: Int){
        for i in 0...sortingOptions.count-1 where i != index{
            sortingOptions[i].isSelected = false
        }
    }
    
    func SortByValue(index: Int){
        let item = sortingOptions[index]
        if item.isSelected{
            item.isSelected = false
        }else{
            item.isSelected = true
            selecSortingValue(index: index)
            switch item.type {
            case .none:
                print("filter by priorities")
                reorderBypriority()
            case .distance:
                print("filter by distance")
                restaurants = sortbyDistance()
            case .popularity:
                print("filter by distance")
                restaurants = sortbyPopularity()
            case .newest:
                print("filter by popularity")
                restaurants = sortbyNewest()
            case .bestMatch:
                print("filter by bestMatch")
                restaurants = sortbyBestMatch()
            case .deliveryCosts:
                print("filter by deliveryCosts")
                restaurants = sortbydeliveryCosts()
            case .minimumCost:
                print("filter by minimumCost")
                restaurants = sortbyMinimumCost()
            case .averageProductPrice:
                print("filter by averageProductPrice")
                restaurants = sortbyAverageProductPrice()
            case .ratingAverage:
                print("filter by ratingAverage")
                restaurants = sortbyRatingAverage()
            }
        }
    }
    
    func filterResturantsByName(searchname: String) -> [Restaurant]{
        return restaurants.filter({$0.name.lowercased().contains(searchname.lowercased())})
    }
    
}
