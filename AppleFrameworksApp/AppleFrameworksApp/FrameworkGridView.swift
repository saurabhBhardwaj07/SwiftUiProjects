//
//  FrameworkGridView.swift
//  AppleFrameworksApp
//
//  Created by Macbook Air  on 06/02/24.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible()) , GridItem(.flexible( )) , GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: columns, content: {
                    ForEach(MockData.frameworks){
                        element in FrameWorkListItem(framework: element).onTapGesture {
                            viewModel.selectedFramework = element
                        }
                    }
                })
            }.navigationTitle("🍎 Frameworks").sheet(isPresented: $viewModel.isShowingDetailsView, content: {
                FrameworkDetailView(element: viewModel.selectedFramework ?? MockData.sampleFramework , isShowingDetailView: $viewModel.isShowingDetailsView)
            })
        }
    }
}

#Preview {
    FrameworkGridView()
}


struct FrameWorkListItem: View {
    let framework: Framework
    
    var body: some View {
        VStack  {
            Image(framework.imageName).resizable().frame(width: 90  , height: 90)
            Text(framework.name).font(.title2).fontWeight(.semibold).scaledToFit().minimumScaleFactor(0.6)
        }.padding()
    }
}
