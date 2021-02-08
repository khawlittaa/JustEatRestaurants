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
                .foregroundColor(.gray)
            
            Text(sortInfoText)
                .font(.system(size: 10.0))
        })
    }
}

struct SortInfo_Previews: PreviewProvider {
    static var previews: some View {
        SortInfo(imageName: "star.fill", sortInfoText: "sorting info")
    }
}
