//
//  RestaurantSortTests.swift
//  JustEatRestaurantsTests
//
//  Created by khaoula hafsia on 9/2/2021.
//

import XCTest
@testable import JustEatRestaurants

class RestaurantSortTests: XCTestCase {
    
    
    func testSortByDistance() throws {
        
        let resaurantsVM = RestaurantsViewModel()
        let sorted = resaurantsVM.sortbyDistance()
        
        XCTAssertEqual("Tanoshii Sushi",sorted[0].name)
        XCTAssertEqual("Lunchpakketdienst",sorted.last?.name)
    }
    
    func testSortByRating() throws {
        
        let resaurantsVM = RestaurantsViewModel()
        let sorted = resaurantsVM.sortbyRatingAverage()
        
        XCTAssertEqual(5.0,sorted[0].sortingValues.ratingAverage)
        XCTAssertEqual(0.0,sorted.last?.sortingValues.ratingAverage)
    }
    
    func testSortByPopularity() throws {
        
        let resaurantsVM = RestaurantsViewModel()
        let sorted = resaurantsVM.sortbyPopularity()
        
        XCTAssertEqual(123.0,sorted.first?.sortingValues.popularity)
        XCTAssertEqual(0.0,sorted.last?.sortingValues.popularity)
    }
    
    func testSortByNewest() throws {
        
        let resaurantsVM = RestaurantsViewModel()
        let sorted = resaurantsVM.sortbyNewest()
        
        XCTAssertEqual(272.0,sorted.first?.sortingValues.newest)
        XCTAssertEqual(73.0,sorted.last?.sortingValues.newest)
    }
    
    func testSortByDeliveryCosts() throws {
        
        let resaurantsVM = RestaurantsViewModel()
        let sorted = resaurantsVM.sortbydeliveryCosts()
        
        XCTAssertEqual(0,sorted.first?.sortingValues.deliveryCosts)
        XCTAssertEqual(500,sorted.last?.sortingValues.deliveryCosts)
    }
    
    func testSortByMinimumCost() throws {
        
        let resaurantsVM = RestaurantsViewModel()
        let sorted = resaurantsVM.sortbyMinimumCost()
        
        XCTAssertEqual(0,sorted.first?.sortingValues.minCost)
        XCTAssertEqual(5000,sorted.last?.sortingValues.minCost)
    }
    
    func testSortBestMatch() throws {
        
        let resaurantsVM = RestaurantsViewModel()
        let sorted = resaurantsVM.sortbyBestMatch()
        
        XCTAssertEqual(306.0,sorted.first?.sortingValues.bestMatch)
        XCTAssertEqual(0.0,sorted.last?.sortingValues.bestMatch)
    }
    
    func testSortByAverageProductPrice() throws {
        
        let resaurantsVM = RestaurantsViewModel()
        let sorted = resaurantsVM.sortbyAverageProductPrice()
        
        XCTAssertEqual(838,sorted.first?.sortingValues.averageProductPrice)
        XCTAssertEqual(4465,sorted.last?.sortingValues.averageProductPrice)
    }
    
    func testSortByName() throws {
        
        let resaurantsVM = RestaurantsViewModel()
        let sorted = resaurantsVM.filterResturantsByName(searchname: "pizza")
        
        XCTAssertEqual(1,sorted.count)
    }
    
}
