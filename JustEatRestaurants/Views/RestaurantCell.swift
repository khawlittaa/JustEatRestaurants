//
//  RestaurantCell.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 8/2/2021.
//

import SwiftUI

struct RestaurantCell: View {
    var restaurant: Restaurant
    var isfavorite: Bool
    
    var body: some View {
        VStack(alignment: .leading , spacing:2){
            HStack(spacing: 2){
                restaurantRating
                restaurantPopularity
                
            }
            
            HStack(alignment: .center, content: {
                Text("\(restaurant.name)")
                    .font(.system(size: 24.0))
                    .foregroundColor(.orange)
                Spacer()
                favoriteIcone
                
            })
            
            HStack(alignment: .center, spacing: 10, content: {
                sortinginformations
                Spacer()
                restaurantStatus
                    .padding(.trailing, 4)
            })
            
        }
        .padding(.all,6)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 0.2)
                .shadow(radius: 0.4 )
                
        )
    }
    
    var restaurantRating: some View{
        if restaurant.sortingValues.ratingAverage.description == "0.0"{
            return  HStack(spacing:2){
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 10, height: 10)
                
                Text("\(restaurant.sortingValues.ratingAverage.description)/5")
                .font(.system(size: 10.0))
                .foregroundColor(.gray)
                
            }
        }else {
            return HStack(spacing:2){
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 10, height: 10)
                
                Text("\(restaurant.sortingValues.ratingAverage.description)/5")
                .font(.system(size: 10.0))
            }
        }
    }
    
    var restaurantPopularity: some View{
        if restaurant.sortingValues.popularity.description == "0.0"{
        return    Text("(\(restaurant.sortingValues.popularity.description))")
                .font(.system(size: 10.0))
                .foregroundColor(.gray)
        }else {
            return    Text("(\(restaurant.sortingValues.popularity.description))")
                .font(.system(size: 10.0))
        }
    }
    var restaurantStatus: some View{
        if restaurant.status == "open"{
            return    Text("\(restaurant.status)")
                .foregroundColor(.green)
                .font(.system(size: 12.0))
        }else{
            if restaurant.status == "order ahead"{
                return    Text("\(restaurant.status)")
                    .foregroundColor(.orange)
                    .font(.system(size: 12.0))
            }else{
                return    Text("\(restaurant.status)")
                    .foregroundColor(.red)
                    .font(.system(size: 12.0))
            }
        }
    }
    
    var favoriteIcone: some View{
        if isfavorite{
            return   Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.pink)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 20))
        }else {
            return   Image(systemName: "heart")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.pink)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
    }
    var sortinginformations: some View{
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 6, content: {
            SortInfo(imageName: "mapDistance", sortInfoText: "\(restaurant.sortingValues.distance) km")
            SortInfo(imageName: "deliveryScooter", sortInfoText: "\(restaurant.sortingValues.deliveryCosts) $")
            SortInfo(imageName: "price", sortInfoText: "Min \(restaurant.sortingValues.minCost) $")
            
        })
    }
    
}

struct RestaurantCell_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCell(restaurant: Restaurant.exemple,isfavorite: true)
    }
}
