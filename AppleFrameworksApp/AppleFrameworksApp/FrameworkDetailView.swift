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
    var body : some View{
        VStack{
            
            HStack{
                Spacer()
                Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark").foregroundColor(Color(.label)).imageScale(.large).frame( width: 44 , height: 44)
                }
            }.padding()
          
            Spacer()
            Image(element.imageName).resizable().frame(width: 90  , height: 90)
            Text(element.name).font(.title2).fontWeight(.semibold).scaledToFit().minimumScaleFactor(0.6)
            Text(element.description).font(.body).padding()
            Spacer()
            AFButton(title: "Learn More"){}
            Spacer()
        }
    }
}


struct FrameworkDetailView_Preview: PreviewProvider{
    static var previews: some View {
        FrameworkDetailView(element: MockData.sampleFramework , isShowingDetailView: .constant(false) )
    }
}


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
