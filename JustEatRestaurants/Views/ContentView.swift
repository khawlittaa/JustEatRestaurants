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
        searchBar
        
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(restaurantsViewModel.sortingOptions.indices){
                    i in
                    SortOptionCell(sortName: restaurantsViewModel.sortingOptions[i].filterTitle, isSelected: restaurantsViewModel.sortingOptions[i].isSelected)
                        .onTapGesture {
                            restaurantsViewModel.SortByValue(index: i)
                        }
                }
            }.padding(.all,4)
        }
        restaurantsList
         
    }
    
    var restaurantsList: some View{
        return  List{
            ForEach(restaurantsViewModel.restaurants){ restaurant in
                RestaurantCell(restaurant: restaurant, isfavorite: isfavorite(restaurant))
                    .padding(.all,2)
                    .listRowInsets(EdgeInsets())
                    .background(Color.white)
            }
        }
        .onAppear(perform: restaurantsViewModel.reorderBypriority)
    }
    var searchBar : some View{
        
      return  VStack(spacing: 0){
            
            HStack{
                
                if !self.isSearching{
                    
                    Text("Restaurants")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                Spacer(minLength: 0)
                
                HStack{
                    
                    if self.isSearching{
                        
                        
                        Image(systemName: "magnifyingglass").padding(.horizontal, 8)
                        
                        TextField("Search Restaurants", text: self.$searchText)
                        
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
            .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
            .padding(.horizontal)
            .padding(.bottom, 10)
            .background(Color.orange)
            
            
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
