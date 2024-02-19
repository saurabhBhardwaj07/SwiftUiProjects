//
//  OrderView.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 09/02/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: OrderViewModel
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List {
                        ForEach(order.items){
                            appetizer in AppetizerListCell(appetizer: appetizer)
                        }.onDelete(perform: { indexSet in
                            order.deleteItem(at: indexSet)
                        }).listStyle(PlainListStyle())
                        
                        
                        Button{
                           } label: {
                               Text("$\(order.totalPrice , specifier: "%.2f") - Place Order").font(.title3).fontWeight(.semibold).frame(width: 260 , height: 50).foregroundColor(.white).background(Color.brandPrimary).cornerRadius(10)
                      }.padding(.bottom , 20)
                        
                    }
                }
                if order.items.isEmpty{
                    EmptyState( imageName: "empty-order", message: "You have no items in your order.\nPlease add an appetizer")
                }
            }.navigationTitle("🛒 Order")
        }
    }
}



struct OrderView_Preview: PreviewProvider{
    static var previews: some View{
        OrderView()
    }
}
