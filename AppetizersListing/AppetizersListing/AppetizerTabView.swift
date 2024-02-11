//
//  AppetizerTabView.swift
//  AppetizersListing
//  Created by Macbook Air  on 09/02/24.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView{
            AppetizerListView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            AccountView().tabItem {
                Image(systemName: "person")
                
                Text("Account")
            }
            
            OrderView().tabItem {
                Image(systemName: "bag")
                Text("Order")
            }
        }.accentColor(Color("brandPrimary"))
    }
}


struct Content_Preview: PreviewProvider{
    static  var previews: some View{
        AppetizerTabView()
    }
}
