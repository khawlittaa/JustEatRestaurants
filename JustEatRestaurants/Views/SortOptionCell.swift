//
//  SortOptionCell.swift
//  JustEatRestaurants
//
//  Created by khaoula hafsia on 8/2/2021.
//

import SwiftUI

struct SortOptionCell: View {
    let sortingValue: String
    @State var isSelected: Bool
    
    var body: some View {
        filterStyle
            .onTapGesture {
                isSelected = !isSelected
            }
    }
    
    var filterStyle: some View{
        if isSelected{
            return Text(sortingValue)
                .filterStyle()
                .background(Color.orange)
                .foregroundColor(.white)
            
        }else {
            return Text(sortingValue)
                .filterStyle()
                .background(Color.white)
                .foregroundColor(.orange)
            
        }
    }
}
