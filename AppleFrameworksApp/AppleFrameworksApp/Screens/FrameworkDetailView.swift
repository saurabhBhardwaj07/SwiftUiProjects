//
//  FrameworkDetailView.swift
//  AppleFrameworksApp
//
//  Created by Macbook Air  on 06/02/24.
//

import SwiftUI

struct FrameworkDetailView: View{

    var element: Framework
    @Binding var isShowingDetailView: Bool
    var hideXMarkButton: Bool = false
    @State private var isShowingSafriView = false
    
    var body : some View{
        VStack{
            if !hideXMarkButton {  HStack{
                Spacer()
                Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark").foregroundColor(Color(.label)).imageScale(.large).frame( width: 44 , height: 44)
                }
            }.padding() }
          
            Spacer()
            Image(element.imageName).resizable().frame(width: 90  , height: 90)
            Text(element.name).font(.title2).fontWeight(.semibold).scaledToFit().minimumScaleFactor(0.6)
            Text(element.description).font(.body).padding()
            Spacer()
            AFButton(title: "Learn More"){
                isShowingSafriView = true
            }
            Spacer()
        }.sheet(isPresented: $isShowingSafriView, content: {
            SafariView(url: URL(string: element.urlString) ?? URL(string: "www.google.com")!)
        })
    }
}


struct FrameworkDetailView_Preview: PreviewProvider{
    static var previews: some View {
        FrameworkDetailView(element: MockData.sampleFramework , isShowingDetailView: .constant(false) )
    }
}



