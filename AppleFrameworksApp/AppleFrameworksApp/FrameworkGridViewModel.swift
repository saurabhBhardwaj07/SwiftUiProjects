//
//  FrameworkGridViewModel.swift
//  AppleFrameworksApp
//
//  Created by Macbook Air  on 06/02/24.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject{
    var selectedFramework:  Framework? {
        didSet {
            isShowingDetailsView = true
        }
    }
    
   @Published var isShowingDetailsView = false
   @Published var showContentInVerticalList = false
   let columns: [GridItem] = [GridItem(.flexible()) , GridItem(.flexible( )) , GridItem(.flexible())]
    
}
