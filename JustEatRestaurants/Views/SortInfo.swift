//
//  SortInfo.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 8/2/2021.
//

import SwiftUI

struct SortInfo: View {
    let imageName: String
    let sortInfoText: String
    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
            Image(imageName)
                .resizable()
                .frame(width: 14, height: 14)
                
            Text(sortInfoText)
                .infostyle()
                .padding(.leading,4)
            
        })
    }
}

