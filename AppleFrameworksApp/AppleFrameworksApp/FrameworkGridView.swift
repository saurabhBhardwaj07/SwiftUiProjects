//
//  FrameworkGridView.swift
//  AppleFrameworksApp
//
//  Created by Macbook Air  on 06/02/24.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        if viewModel.showContentInVerticalList {
            NavigationView {
                List{
                    ForEach(MockData.frameworks){ element in
                        NavigationLink(destination : FrameworkDetailView(element: element, isShowingDetailView: $viewModel.isShowingDetailsView, hideXMarkButton: true) ){
                            HStack{
                                Image(element.imageName).resizable().frame(width: 70  , height: 70)
                                Text(element.name).font(.title2).fontWeight(.semibold).scaledToFit().minimumScaleFactor(0.6).padding()
                                Spacer()
                            }
                        }
                    }
                }.navigationTitle("🍎 Frameworks").toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button( viewModel.showContentInVerticalList == true ? "Toggle to Grid List" : "Toggle to VStack") {
                            viewModel.showContentInVerticalList.toggle()
                        }
                    }
                }
            }
        } else {
            NavigationView {
                ScrollView{
                        LazyVGrid(columns: viewModel.columns, content: {
                            ForEach(MockData.frameworks){
                                element in FrameWorkListItem(framework: element).onTapGesture {
                                    viewModel.selectedFramework = element
                                }
                            }
                        })
                }.navigationTitle("🍎 Frameworks").toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button( viewModel.showContentInVerticalList == true ? "Toggle to Grid List" : "Toggle to VStack") {
                            viewModel.showContentInVerticalList.toggle()
                        }
                    }
                }
                .sheet(isPresented: $viewModel.isShowingDetailsView, content: {
                    FrameworkDetailView(element: viewModel.selectedFramework ?? MockData.sampleFramework , isShowingDetailView: $viewModel.isShowingDetailsView)
                })
            }
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
