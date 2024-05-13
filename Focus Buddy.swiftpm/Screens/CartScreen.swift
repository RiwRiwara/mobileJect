import SwiftUI

struct CartScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    // Your list of cart items here
                    Text("Item 1")
                    Text("Item 2")
                    Text("Item 3")
                }
                .listStyle(InsetGroupedListStyle())
                
                Spacer()
                
                // Total price or checkout button
                Button(action: {
                    // Action when checkout button is tapped
                }) {
                    Text("Checkout")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                }
                .padding(.bottom, 20)
            }
            .navigationBarTitle("Cart")
        }
    }
}