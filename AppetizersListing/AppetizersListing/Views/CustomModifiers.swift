//
//  CustomModifiers.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 18/02/24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier{
    func body(content: Content) -> some View {
        content.buttonStyle(.bordered)
            .tint(.BrandPrimary).controlSize(.large)
    }
}

extension View{
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
