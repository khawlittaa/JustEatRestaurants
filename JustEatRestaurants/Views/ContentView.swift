//
//  ContentView.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 5/2/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var restaurantsViewModel = RestaurantsViewModel()
    
    var body: some View {
            SearchBar()
        
        ScrollView(.horizontal){
                HStack{
                SortOptionCell(sortingValue: "All")
                SortOptionCell(sortingValue: "value1")
                SortOptionCell(sortingValue: "value1")
                SortOptionCell(sortingValue: "value1")
            }
        }
        List{
            ForEach(restaurantsViewModel.restaurants){ restaurant in
                RestaurantCell(restaurant: restaurant, isfavorite: restaurantsViewModel.isfavorite(restaurant))
                    .padding(.all,2)
                    .listRowInsets(EdgeInsets())
                    .background(Color.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
