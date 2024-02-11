//
//  OrderView.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 09/02/24.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationView{
            Text("Order view").navigationTitle("🛒 Orders")
        }

    }
}



struct OrderView_Preview: PreviewProvider{
    static var previews: some View{
        OrderView()
    }
}
