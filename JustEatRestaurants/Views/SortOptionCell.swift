//
//  SortOptionCell.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 8/2/2021.
//

import SwiftUI

struct SortOptionCell: View {
// @State  var sortingValue: SortOption
    var sortName: String
    @State var isSelected: Bool
    
    var body: some View {
       filterStyle
    }

    var filterStyle: some View{
        if isSelected{
           return Text(sortName)
                .filterStyle()
                .background(Color.orange)
                .foregroundColor(.white)
            
        }else {
            return Text(sortName)
            .filterStyle()
            .background(Color.white)
            .foregroundColor(.orange)
            
        }
    }
}
