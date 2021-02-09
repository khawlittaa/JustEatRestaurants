//
//  TextStyleExtension.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 8/2/2021.
//

import SwiftUI

extension Text{
    func filterStyle() -> some View {
        self
            .frame(height: 30)
            .cornerRadius(10)
            .font(.system(size: 12.0))
            .padding(.all,2)
        
    }
    
    func titleStyle() -> some View{
        self
            .font(.system(size: 24.0))
            .foregroundColor(.orange)
    }
    
    func infostyle() -> some View{
        self
            .font(.system(size: 10.0))
    }
    func statusstyle() -> some View{
        self
            .font(.system(size: 12.0))
    }
}
