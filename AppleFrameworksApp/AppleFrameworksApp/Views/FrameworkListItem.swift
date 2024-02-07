//
//  FrameworkListItem.swift
//  AppleFrameworksApp
//
//  Created by Macbook Air  on 08/02/24.
//

import SwiftUI

struct FramworkKistItem :View {
    let element: Framework
    var body: some View {
        HStack{
            Image(element.imageName).resizable().frame(width: 70  , height: 70)
            Text(element.name).font(.title2).fontWeight(.semibold).scaledToFit().minimumScaleFactor(0.6).padding()
            Spacer()
        }
    }
}
