//
//  AppetizerListViewModel.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 17/02/24.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject{
    
    @Published var appetizers : [AppetizerModelClass] = []
//    @Published var alertTime: Aler
    @Published var isLoading = false
    @Published var isShowingDetails = false
    @Published var selectedAppetizers: AppetizerModelClass?
    
    
    func getAppetizers(){
        NetworkManager.shared.getAppetizers{ result in
            DispatchSerialQueue.main.async {
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }

    
}

