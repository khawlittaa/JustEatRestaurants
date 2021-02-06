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
        
        XCTAssertEqual(0,resaurantsVM.favorites.count)
        XCTAssertEqual(19,resaurantsVM.restaurants.count)
        
        
    }

}
