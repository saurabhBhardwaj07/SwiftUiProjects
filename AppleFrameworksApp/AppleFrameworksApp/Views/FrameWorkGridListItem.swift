//
//  FrameWorkListItem.swift
//  AppleFrameworksApp
//
//  Created by Macbook Air  on 08/02/24.
//

import SwiftUI

struct FrameWorkGridListItem: View {
    let framework: Framework
    
    var body: some View {
        VStack  {
            Image(framework.imageName).resizable().frame(width: 90  , height: 90)
            Text(framework.name).font(.title2).fontWeight(.semibold).scaledToFit().minimumScaleFactor(0.6)
        }.padding()
    }
}
