//
//  ContentView.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 5/2/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var restaurantsViewModel = RestaurantsViewModel()
    @State var isSearching = false
    @State var searchText = ""
    
    var body: some View {
        VStack{
            searchBar
            filtersList
                    if self.searchText != ""{
                        if restaurantsViewModel.filterResturantsByName(searchname: self.searchText).count == 0{
                            Text(NSLocalizedString("No Results", comment: "No Results found in search")).padding(.top, 10)
                            Spacer()
                        }
                        else{
    ///                     display list of restaurants that matches search Result
                                List(restaurantsViewModel.filterResturantsByName(searchname: self.searchText)) { restaurant in
                                    RestaurantCell(restaurant: restaurant, isfavorite: isfavorite(restaurant))
                                        .padding(.all,2)
                                        .listRowInsets(EdgeInsets())
                                        .background(Color.white)
                                       }
                        }
                    }
                    else{
    ///                    Not seaching here so display all restaurants
                        List(restaurantsViewModel.restaurants) { restaurant in
                            RestaurantCell(restaurant: restaurant, isfavorite: isfavorite(restaurant))
                                .padding(.all,2)
//                                .listRowInsets(EdgeInsets())
                                .background(Color.white)
                               }
                    }
        }.edgesIgnoringSafeArea(.top)
       
        
            }
    
    
    var filtersList: some View{
        return
            ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(restaurantsViewModel.sortingOptions.indices){
                    i in
                    SortOptionCell(sortName: restaurantsViewModel.sortingOptions[i].filterTitle, isSelected: restaurantsViewModel.sortingOptions[i].isSelected)
                        .onTapGesture {
                            restaurantsViewModel.SortByValue(index: i)
                        }
                }
            }
            .id(UUID())
            .padding(.all,4)
            .frame(height: 30)
        }
    }
    
    var searchBar : some View{
        
        return
            VStack{
            
            HStack{
                if !self.isSearching{
                    Text(NSLocalizedString("title", comment: "title of the view"))
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                }
                Spacer(minLength: 0)
                
                HStack{
                    
                    if self.isSearching{
                        Image(systemName: "magnifyingglass").padding(.horizontal, 8)
                        
                        TextField(NSLocalizedString("searchPlaceholderText", comment: "place Holder text in searchBar") , text: self.$searchText)
                        
                        Button(action: {
                            withAnimation {
                                self.searchText = ""
                                self.isSearching.toggle()
                            }
                            
                        }) {
                            Image(systemName: "xmark").foregroundColor(.black)
                        }
                        .padding(.horizontal, 8)
                        
                    }
                    
                    else{
                        
                        Button(action: {
                            withAnimation {
                                self.isSearching.toggle()
                            }
                        }) {
                            Image(systemName: "magnifyingglass").foregroundColor(.black).padding(10)
                        }
                    }
                }
                .padding(self.isSearching ? 10 : 0)
                .background(Color.white)
                .cornerRadius(20)
            }
            .padding(.top,40)
            .padding(.horizontal)
            .padding(.bottom, 10)
            .background(Color.orange)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
