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
        ZStack {
            NavigationView{
                List(viewModel.appetizers , id: \.id){
                    apetizer in  AppetizerListCell(appetizer: apetizer).listRowSeparator(.hidden, edges: /*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).onTapGesture {
                        viewModel.selectedAppetizers = apetizer
                        viewModel.isShowingDetails = true
                    }
                }.navigationTitle("🍔 Appetizers")
                 .listStyle(.plain)
                 .disabled(viewModel.isShowingDetails)
            }
            .task {
                viewModel.getAppetizers()
            }.blur(radius: viewModel.isShowingDetails ? 20 : 0)
            if(viewModel.isLoading){
                LoadingView()
            }
            if viewModel.isShowingDetails {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizers!, isShowingDetail: $viewModel.isShowingDetails)
            }
            
        }.alert (item: $viewModel.alertTime){ alertItem in
            Alert(title: alertItem.title , message: alertItem.message , dismissButton: alertItem.dismissButton)
        }
        
        
    }
}


struct AppetizerListView_Preview: PreviewProvider{
    static var previews: some View{
        AppetizerListView()
    }
}

