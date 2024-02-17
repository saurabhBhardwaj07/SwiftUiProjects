//
//  RemoteImage.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 13/02/24.
//

import SwiftUI

//final class ImageLoader : ObservableObject{
//    @Published var image: Image? = null
//    func load(fromUrlString urlString : String){
//        
//    }
//}s




struct RemoteImage: View {
    
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image(systemName: "food-placeholder").resizable()
    }
}

#Preview {
    RemoteImage()
}
