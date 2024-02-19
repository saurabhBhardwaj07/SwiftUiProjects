//
//  AccountViewModel.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 18/02/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject{
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    
    
    
    var isValidForm : Bool {
        guard !user.firstName.isEmpty && !user.lastname.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
//        guard email.isValidEmail else {
//            alertItem = AlertContext.invalidEmail
//            return false
//        }
        return true
    }
    
    
    func saveChanges() {
        guard isValidForm else { return }
        do {
            let data =  try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSucess
            
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser(){
        guard let userData else { return }
        do{
            user =  try JSONDecoder().decode(User.self, from: userData)
        } catch{
            alertItem = AlertContext.invalidForm
        }
    }
    
}
