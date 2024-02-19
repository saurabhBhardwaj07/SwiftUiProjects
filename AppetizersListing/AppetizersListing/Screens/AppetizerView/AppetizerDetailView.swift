//
//  AppetizerDetailView.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 18/02/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: OrderViewModel
     
    let appetizer: AppetizerModelClass
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL).aspectRatio(contentMode: .fit).frame(width:  300 , height: 225 , alignment: .center)
            VStack{
                Text(appetizer.name).font(.title2).fontWeight(.semibold)
                 Text(appetizer.description).multilineTextAlignment(.center).font(.body).padding()
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: "\(appetizer.calories) g")
                    NutritionInfo(title: "Carbs", value: "\(appetizer.carbs) g")
                    NutritionInfo(title: "Protien", value: "\(appetizer.protein) g")
                }
                Spacer()
                  Button{
                      order.add(appetizer)
                      isShowingDetail = false
                } label: {
                    Text("$\(appetizer.price , specifier: "%.2f") - Add to Order").font(.title3).fontWeight(.semibold).frame(width: 260 , height: 50).foregroundColor(.white).background(Color.brandPrimary).cornerRadius(10)
                }
//                .modifier(StandardButtonStyle())
                    .padding(.bottom , 30)
                
            }
        }.frame(width: 300 , height: 525).background(Color(.systemBackground)).cornerRadius(12).shadow(radius: 40).overlay(
            Button{
                isShowingDetail = false
            } label: {
                XDismissButton()
            } , alignment:  .topTrailing
        )
    }
}

struct NutritionInfo: View {
    let title: String
    let value: String
    var body: some View {
        VStack{
            Text(title).bold().font(.caption)
            Text(value).foregroundColor(.secondary).fontWeight(.semibold).italic()
        }
    }
}

#Preview {
    AppetizerDetailView( appetizer: MockData.sampleAppetizer , isShowingDetail: .constant(true))
}
