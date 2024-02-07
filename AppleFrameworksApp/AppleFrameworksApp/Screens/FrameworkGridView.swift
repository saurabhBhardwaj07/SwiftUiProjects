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
                            FramworkKistItem(element: element)
                        }
                    }
                }.navigationTitle("🍎 Frameworks").toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button( viewModel.showContentInVerticalList == true ? "Toggle to Grid List" : "Toggle to VStack") {
                            viewModel.showContentInVerticalList.toggle()
                        }
                    }
                }
            }.accentColor(Color(.label))
        } else {
            NavigationView {
                ScrollView{
                        LazyVGrid(columns: viewModel.columns, content: {
                            ForEach(MockData.frameworks){
                                element in FrameWorkGridListItem(framework: element).onTapGesture {
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

