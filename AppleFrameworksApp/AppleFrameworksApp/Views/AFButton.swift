//
//  AFButton.swift
//  AppleFrameworksApp
//
//  Created by Macbook Air  on 07/02/24.
//

import SwiftUI


struct AFButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(title).font(.title2).fontWeight(.semibold).frame(width: 280 , height: 50).background(Color.red).foregroundColor(.white).cornerRadius(10)
        }
    }
}
