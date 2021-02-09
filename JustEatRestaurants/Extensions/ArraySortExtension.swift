//
//  ArraySortExtension.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 8/2/2021.
//

import Foundation

extension Array where Element == Restaurant {
    
    func reordebyStatus() -> [Restaurant] {
        
        let defaultOrder = ["open", "order ahead", "closed"]
        
        return self.sorted { (a, b) -> Bool in
            if let first = defaultOrder.index(of: a.status), let second = defaultOrder.index(of: b.status) {
                return first < second
            }
            return false
        }
    }
    
    func reorderRestaurants() -> [Restaurant] {
        let defaultOrder = ["open", "order ahead", "closed"]
        
        return self.sorted { (res1taurant1, restaurant2) -> Bool in
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
}
