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
        
                Text(sortingValue)
                    .frame(width: width, height: 30)
                    .background(Color.orange)
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    .font(.system(size: 12.0))
    
    }
}

struct SortOptionCell_Previews: PreviewProvider {
    static var previews: some View {
        SortOptionCell(sortingValue: "distance")
    }
}
