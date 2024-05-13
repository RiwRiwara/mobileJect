import SwiftUI

struct CartScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var cartItems: CartItems 
    var body: some View {
        NavigationView {
            VStack {
        NavigationView {

            List {
                ForEach(cartItems.itemss, id: \.self) { item in
                    Text(item.name)
                }
                .onDelete(perform: deleteItem)
            }
            .navigationBarTitle("Cart")
            .nav
                
                Spacer()
                
                // Total price or checkout button
                Button(action: {
                    // Action when checkout button is tapped
                }) {
                    Text("Checkout")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(ColorConfig.Primary.base)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                }
                .padding(.bottom, 20)
            }
            .navigationBarTitle("Cart")
            .navigationBarBackButtonHidden(true) // Hide the default back button
            .navigationBarItems(leading:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss() // Dismiss the view when "Go Back" button is tapped
                }) {
                    Image(systemName: "arrow.left") // You can customize the button appearance here
                }
            )
        }
    }// body

        func deleteItem(at offsets: IndexSet) {
        cartItems.items.remove(atOffsets: offsets)
    }
}
