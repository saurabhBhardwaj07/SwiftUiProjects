//
//  Alerts.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 17/02/24.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let  title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertContext{
    // Mark: - Network Alerts
    static let invalidData = AlertItem(title: Text("Server Erro"), message: Text("The data reecived from the server was invalid. Please contact support."), dismissButton: .default(Text("Ok")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid Response from the server. Please try again later or contact support"), dismissButton: .default(Text("Ok")))
    
    static let invalidUrl = AlertItem(title: Text("Server Error"), message: Text("There was and issue connecting to the server. If this persists, plese contact support."), dismissButton: .default(Text("Ok")))
    
    static let unableTocomplete = AlertItem(title: Text("Server Error"), message: Text("Unable to complete your request at this time. Please check your internet connection"), dismissButton: .default(Text("Ok")))
    
    
    
    
    // Mark: - Account Form Alerts
    
    static let invalidForm = AlertItem(title: Text("Invalid Form"), message: Text("Please ensure all fields in the form have been filled out."), dismissButton: .default(Text("Ok")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"), message: Text("Please ensure your email is correct."), dismissButton: .default(Text("Ok")))
    
    static let userSaveSucess = AlertItem(title: Text("Profile Saved"), message: Text("Your Profile information saved succesfully."),
                                          dismissButton: .default(Text("Ok")))
    
    static let invalidUserData = AlertItem(title: Text("Profile Error"), message: Text("There was an error saving or retrieving your profile."), dismissButton: .default(Text("Ok")))
}
