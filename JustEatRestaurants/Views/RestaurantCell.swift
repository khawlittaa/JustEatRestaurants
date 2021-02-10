//
//  RestaurantCell.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 8/2/2021.
//

import SwiftUI

struct RestaurantCell: View {
    var restaurant: Restaurant
    @State var isfavorite: Bool
    
    var body: some View {
        VStack(alignment: .leading , spacing:4){
            
            HStack(alignment: .center, content: {
                Text("\(restaurant.name)")
                    .titleStyle()
                Spacer()
                favoriteIcone
                    .onTapGesture {
                        toggleFavoriterestaurant()
                    }
            })
            
            HStack(spacing: 2){
                restaurantRating
                restaurantPopularity
                    .infostyle()
                //                Spacer()
                restaurantStatus
                    . statusstyle()
                    .padding(.leading,15)
                    .padding(.trailing, 4)
            }
            
            sortinginformations
        }
        .padding(.all,6)
    }
    
    /// View for displaying Restaurants rating average with star icon
    var restaurantRating: some View{
        if restaurant.sortingValues.ratingAverage.description == "0.0"{
            return  HStack(spacing:2){
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 10, height: 10)
                
                Text("\(restaurant.sortingValues.ratingAverage.description)/5")
                    .infostyle()
                    .foregroundColor(.gray)
                
            }
        }else {
            return HStack(spacing:2){
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 10, height: 10)
                
                Text("\(restaurant.sortingValues.ratingAverage.description)/5")
                    .infostyle()
                    .foregroundColor(.black)
            }
        }
    }
    
    /// Text displaying popularity value
    var restaurantPopularity: Text{
        if restaurant.sortingValues.popularity.description == "0.0"{
            return    Text("(\(restaurant.sortingValues.popularity.description))")
                .foregroundColor(.gray)
        }else {
            return    Text("(\(restaurant.sortingValues.popularity.description))")
        }
    }
    /// text  displaying restaurants status: Open, order ahead or Closed with different Foreground color for each status
    var restaurantStatus: Text{
        if restaurant.status == "open"{
            return    Text("\(restaurant.status)")
                .foregroundColor(.green)
        }else{
            if restaurant.status == "order ahead"{
                return    Text("\(restaurant.status)")
                    .foregroundColor(.orange)
            }else{
                return    Text("\(restaurant.status)")
                    .foregroundColor(.red)
            }
        }
    }
    /// displaying favorite Image and changing it based when restaurant is added or deleted from favorites
    var favoriteIcone: some View{
        if isfavorite{
            return   Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.pink)
        }else {
            return
                Image(systemName: "heart")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.pink)
        }
    }
    /// View for displaying Restaurants Sorting values
    var sortinginformations: some View{
        HStack(alignment: .center, content: {
            SortInfo(imageName: "map", sortInfoText: "\(restaurant.sortingValues.distance) Meter")
            SortInfo(imageName: "motorcycle", sortInfoText: "\(restaurant.sortingValues.deliveryCosts)€")
            SortInfo(imageName: "euro-price-tag", sortInfoText: "Min \(restaurant.sortingValues.minCost)€")
            
        })
    }
    
    func toggleFavoriterestaurant() {
        toggleFavorite(restaurant)
        isfavorite = JustEatRestaurants.isfavorite(restaurant)
    }
}

struct RestaurantCell_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCell(restaurant: Restaurant.exemple,isfavorite: true)
    }
}
