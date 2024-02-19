//
//  Order.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 19/02/24.
//

import SwiftUI

final class OrderViewModel: ObservableObject {
    
    @Published var items: [AppetizerModelClass] = []
    
    
    var totalPrice: Double {
        items.reduce(0){
            $0 + $1.price
        }
    }
    
    func add(_ appetizer: AppetizerModelClass) {
        items.append(appetizer)
    }
    
    func deleteItem(at offset: IndexSet){
        items.remove(atOffsets: offset)
    }
    
    
}
