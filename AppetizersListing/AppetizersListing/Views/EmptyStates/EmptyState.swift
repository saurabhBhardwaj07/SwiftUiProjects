//
//  EmptyState.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 19/02/24.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    
    var body: some View {
        ZStack{
            Color(.systemBackground).ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)
                
                Text(message).font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
                
            }
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "This is Text Message")
}
