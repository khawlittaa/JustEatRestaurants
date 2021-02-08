//
//  SortOptionCell.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 8/2/2021.
//

import SwiftUI

struct SortOptionCell: View {
    let sortingValue: String
    
    var body: some View {
        let width = (UIScreen.main.bounds.width / 4) - 20
        
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: width, height: 20)
                .foregroundColor(.white)
                .border(Color.orange, width: 1)
        
                Text(sortingValue)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .font(.system(size: 12.0))
    }
    }
}

struct SortOptionCell_Previews: PreviewProvider {
    static var previews: some View {
        SortOptionCell(sortingValue: "distance")
    }
}
