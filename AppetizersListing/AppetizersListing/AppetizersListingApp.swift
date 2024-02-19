//
//  AppetizersListingApp.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 09/02/24.
//

import SwiftUI

@main
struct AppetizersListingApp: App {
    
    var order = OrderViewModel()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
