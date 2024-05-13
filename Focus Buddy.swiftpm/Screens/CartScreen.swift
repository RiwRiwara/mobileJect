import SwiftUI

struct CartScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var cartItems: CartItems 
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(cartItems.items, id: \.self) { item in
                        Text(item.name)
                    }
                    .onDelete(perform: deleteItem) // Enable swipe to delete
                }
                .listStyle(InsetGroupedListStyle())
                
                Spacer()
                
                Button(action: {
                    // Action when checkout button is tapped
                }) {
                    Text("Checkout")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue) // Use your desired color here
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                }
                .padding(.bottom, 20)
            }
            .navigationBarTitle("Cart")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                }
            )
        }// NavigationView
    }
    
    func deleteItem(at offsets: IndexSet) {
        cartItems.items.remove(atOffsets: offsets)
    }
}
