//
//  RestaurantViewModelTests.swift
//  JustEatRestaurantsTests
//
//  Created by khaoula hafsia on 6/2/2021.
//

import XCTest
@testable import JustEatRestaurants

class RestaurantViewModelTests: XCTestCase {
    
    func testRestaurantJsonParser() throws {
        let json = """
        {
        "name": "Tanoshii Sushi",
        "status": "open",
        "sortingValues": {
            "bestMatch": 0.0,
            "newest": 96.0,
            "ratingAverage": 4.5,
            "distance": 1190,
            "popularity": 17.0,
            "averageProductPrice": 1536,
            "deliveryCosts": 200,
            "minCost": 1000
        }
        }
        """
        let jsonData = json.data(using: .utf8)!
        let restaurantData =  try! JSONDecoder().decode(Restaurant.self, from: jsonData)
        
        XCTAssertEqual("Tanoshii Sushi",restaurantData.name)
        XCTAssertEqual("open",restaurantData.status)
        XCTAssertEqual( 17.0,restaurantData.sortingValues.popularity)
        XCTAssertEqual( 4.5,restaurantData.sortingValues.ratingAverage)
        XCTAssertEqual(200,restaurantData.sortingValues.deliveryCosts)
        XCTAssertEqual(1536,restaurantData.sortingValues.averageProductPrice)
        
    }
    
    func testrestaurantsInit() throws{
        let resaurantsVM = RestaurantsViewModel()
        
        XCTAssertEqual(19,resaurantsVM.restaurants.count)
    }
    
    func testAddFavorite() throws{
        let resaurantsVM = RestaurantsViewModel()
        
        let fav = resaurantsVM.restaurants[0]
        addFavorite(fav)
        XCTAssertTrue(isfavorite(fav))
        UserDefaults.standard.set(Array([]), forKey: "Favorites")
    }
    
    func testRemovefavorite() throws{
        let resaurantsVM = RestaurantsViewModel()
        UserDefaults.standard.set(Array([]), forKey: "Favorites")
        
        let fav = resaurantsVM.restaurants[0]
        let fav1 = resaurantsVM.restaurants[1]
        
        addFavorite(fav)
        addFavorite(fav1)
        
        removeFavorite(fav)
        
        XCTAssertTrue(isfavorite(fav1))
        XCTAssertFalse(isfavorite(fav))
        
        UserDefaults.standard.set(Array([]), forKey: "Favorites")
        
    }
    
    
    func testsortBystatus() throws{
        let json = """
        [{
        "name": "Tanoshii Sushi",
        "status": "open",
        "sortingValues": {
            "bestMatch": 0.0,
            "newest": 96.0,
            "ratingAverage": 4.5,
            "distance": 1190,
            "popularity": 17.0,
            "averageProductPrice": 1536,
            "deliveryCosts": 200,
            "minCost": 1000
        }
        }, {
        "name": "Tandoori Express",
        "status": "closed",
        "sortingValues": {
            "bestMatch": 1.0,
            "newest": 266.0,
            "ratingAverage": 4.5,
            "distance": 2308,
            "popularity": 123.0,
            "averageProductPrice": 1146,
            "deliveryCosts": 150,
            "minCost": 1300
        }
        }, {
        "name": "Royal Thai",
        "status": "order ahead",
        "sortingValues": {
            "bestMatch": 2.0,
            "newest": 133.0,
            "ratingAverage": 4.5,
            "distance": 2639,
            "popularity": 44.0,
            "averageProductPrice": 1492,
            "deliveryCosts": 150,
            "minCost": 2500
        }
        }]
        """
        
        let jsonData = json.data(using: .utf8)!
        let restaurantData =  try! JSONDecoder().decode([Restaurant].self, from: jsonData)
        
        let sorted = restaurantData.reordebyStatus()
        
        XCTAssertEqual("Tanoshii Sushi",sorted[0].name)
        XCTAssertEqual("Royal Thai",sorted[1].name)
        XCTAssertEqual("Tandoori Express",sorted[2].name)
        
    }
    
    func testOrderRestaurants() throws{
        
        let resaurantsVM = RestaurantsViewModel()
        let fav = resaurantsVM.restaurants[3]
        
        addFavorite(fav)
        
        let sorted =  resaurantsVM.restaurants.reorderRestaurants()
        
        XCTAssertTrue(isfavorite((sorted.first)!))
        XCTAssertEqual("closed",sorted.last?.status)
        
        XCTAssertTrue(isfavorite(fav))
        
        UserDefaults.standard.set(Array([]), forKey: "Favorites")
    }
    
}
