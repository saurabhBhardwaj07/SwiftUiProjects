//
//  AppetizerListView.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 09/02/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    // for passing the data refrence use ObservedObject
    // and to intiallize the state use SateObject
    @StateObject var viewModel = AppetizerListViewModel()
    var body: some View {
        NavigationView{
            List(viewModel.appetizers , id: \.id){
                apetizer in  AppetizerListCell(appetizer: apetizer)
            }.navigationTitle("🍔 Appetizers")
        }.onAppear{
            viewModel.getAppetizers()
        }
    }
}


struct AppetizerListView_Preview: PreviewProvider{
    static var previews: some View{
        AppetizerListView()
    }
}

