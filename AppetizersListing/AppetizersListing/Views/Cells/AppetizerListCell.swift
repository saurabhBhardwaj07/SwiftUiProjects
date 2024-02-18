//
//  AppetizerListCell.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 13/02/24.
//

import SwiftUI

import Foundation

struct AppetizerListCell: View {
    let appetizer: AppetizerModelClass
    
    var body: some View {
        HStack (){
            AppetizerRemoteImage(urlString: appetizer.imageURL).aspectRatio(contentMode: .fit).frame(width:  120 , height: 90 , alignment: .center).cornerRadius(8)
//            Image("asian-flank-steak").resizable().aspectRatio(contentMode: .fit).frame(width:  120 , height: 90 , alignment: .center).cornerRadius(8)
        
            VStack(alignment: .leading , spacing: 5)   {
                Text(appetizer.name).font(.title2).fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")" ).foregroundColor(.secondary).fontWeight(.semibold)
            }.padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
