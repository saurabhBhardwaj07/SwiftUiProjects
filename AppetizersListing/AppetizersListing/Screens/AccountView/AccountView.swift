//
//  AccountView.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 09/02/24.
//

import SwiftUI

struct AccountView : View {
    
    
//    @FocusState private var focusedTextField: FormText?
    
   @StateObject var viewModel = AccountViewModel()

    
    
    var body: some View {
        NavigationView{
            Form{
                
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                        .submitLabel(.next)
                    
                    TextField("Last name" , text: $viewModel.user.lastname)
                        .submitLabel(.next)
                    
                    TextField("Email",text:$viewModel.user.email)
                        .submitLabel(.next)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birthday" , selection: $viewModel.user.birthDate)
                    Button{
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")){
                    Toggle("Extra Napkins" , isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills" , isOn: $viewModel.user.fewquentRefills)
                }.toggleStyle(SwitchToggleStyle(tint: .BrandPrimary))
                
            
            }.navigationTitle("👦🏻 Account").toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Button("Dismiss"){
                        
                    }
                }
            }.onAppear{
                viewModel.retrieveUser()
            }
        }.alert(item: $viewModel.alertItem){
            alertItem in
            Alert(title: alertItem.title , message: alertItem.message , dismissButton: alertItem.dismissButton)
            
        }
    }
}



struct AccountView_Preview: PreviewProvider{
    static var previews: some View{
        AccountView()
    }
}
