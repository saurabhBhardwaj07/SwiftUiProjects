//
//  AppetizerListView.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 09/02/24.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView{
            Text("AppetizerList view").navigationTitle("🍔 Appetizers")
        }
    }
}


struct AppetizerListView_Preview: PreviewProvider{
    static var previews: some View{
        AppetizerListView()
    }
}
