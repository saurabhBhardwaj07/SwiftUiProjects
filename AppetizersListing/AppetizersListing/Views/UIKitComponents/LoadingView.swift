//
//  SwiftUIView.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 17/02/24.
//

import SwiftUI


// showing loader by the UIKIT
struct ActivityIndicator: UIViewRepresentable{
    
    func makeUIView(context: Context) -> some UIActivityIndicatorView {
        
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.BrandPrimary
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    
    }
    
}




struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground).ignoresSafeArea(.all)
//            ActivityIndicator()
            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .BrandPrimary)).scaleEffect(3)
        }
        
    }
}

#Preview {
    LoadingView()
}
