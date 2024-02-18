//
//  RemoteImage.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 18/02/24.
//

import SwiftUI

final class ImageLoader: ObservableObject{
    @Published var image: Image? = nil
    func load(urlString: String){
        NetworkManager.shared.downloadImage(fromUrlString: urlString){
            uiImage in

            guard let uiImage = uiImage else{ return}
            
            
                  DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
               
                  }
        }
        
    }
}


struct RemoteImageView: View {
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}


struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString : String
    
    var body: some View {
        RemoteImageView(image: imageLoader.image).onAppear{
            imageLoader.load(urlString: urlString)
        }
    }
}
