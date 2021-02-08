//
//  SearchBar.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 8/2/2021.
//

import SwiftUI

struct SearchBar: View {
    
    @State var show = false
    @State var txt = ""
    
    var body : some View{
        
        VStack(spacing: 0){
            
            HStack{
                
                if !self.show{
                    
                    Text("Restaurants")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                Spacer(minLength: 0)
                
                HStack{
                    
                    if self.show{
                        
                        
                        Image(systemName: "magnifyingglass").padding(.horizontal, 8)
                        
                        TextField("Search Restaurants", text: self.$txt)
                        
                        Button(action: {
                            
                            withAnimation {
                                
                                self.txt = ""
                                self.show.toggle()
                            }
                            
                        }) {
                            
                            Image(systemName: "xmark").foregroundColor(.black)
                        }
                        .padding(.horizontal, 8)
                        
                    }
                    
                    else{
                        
                        Button(action: {
                            
                            withAnimation {
                                
                                self.show.toggle()
                            }
                            
                        }) {
                            Image(systemName: "magnifyingglass").foregroundColor(.black).padding(10)
                            
                        }
                    }
                }
                .padding(self.show ? 10 : 0)
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

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
