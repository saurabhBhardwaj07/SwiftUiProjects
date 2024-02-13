//
//  AccountView.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 09/02/24.
//

import SwiftUI

struct AccountView : View {
    var body: some View {
        NavigationView{
            Text("Account view").navigationTitle("👨‍🦰 Account")
        }
    }
}



struct AccountView_Preview: PreviewProvider{
    static var previews: some View{
        AccountView()
    }
}
