//
//  AppetizerListViewModel.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 17/02/24.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject{
    
    @Published var appetizers : [AppetizerModelClass] = []
    @Published var alertTime: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetails = false
    @Published var selectedAppetizers: AppetizerModelClass?
    
    // main actor-isolated property self with dataTyoe can not be mutated from a sendabe closure; this is an error in swift 6
//    func getAppetizers(){
//        isLoading = true
//        NetworkManager.shared.getAppetizers{ result in
//            DispatchSerialQueue.main.async {
//                self.isLoading = false
//                switch result{
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch error {
//                    case .invalidResponse:
//                        self.alertTime = AlertContext.invalidResponse
//                    case .invalidUrl:
//                        self.alertTime = AlertContext.invalidUrl
//                    case .invalidData:
//                        self.alertTime = AlertContext.invalidData
//                    case .unableToComplete:
//                        self.alertTime = AlertContext.unableTocomplete
//                    }                }
//            }
//        }
//    }
    
    func getAppetizers() {
        isLoading = true
        
        Task {
            do{
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                 
                if let apiError = error as? ApiError {
                    switch apiError {
                    case .invalidResponse:
                    self.alertTime = AlertContext.invalidResponse
                    case .invalidUrl:
                    self.alertTime = AlertContext.invalidUrl
                    case .invalidData:
                    self.alertTime = AlertContext.invalidData
                    case .unableToComplete:
                    self.alertTime = AlertContext.unableTocomplete                    }
                } else {
                    alertTime = AlertContext.unableTocomplete
                }

                isLoading = false
            }
        }
    }
}

