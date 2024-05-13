import SwiftUI

class CartItems: ObservableObject {
    @Published var items: [Item] = []
    
    func addItem(_ item: Item) {
        items.append(item)
    }
    
    func removeItem(at index: Int) {
        items.remove(at: index)
    }
}