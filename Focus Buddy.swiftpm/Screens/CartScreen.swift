import SwiftUI

struct CartScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var cartItems: CartItems 
    let maxNameLength = 30
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(cartItems.items, id: \.self) { item in
                      VStack(alignment: .leading, spacing: 8) {
                            Text(item.name.prefix(maxNameLength))
                                .font(.body)
                                .lineLimit(1) // Ensure only one line is displayed
                                .truncationMode(.tail) // Add an ellipsis (...) if the name exceeds the limit
                            
                            Text(item.sale ?? "")
                                .foregroundColor(.secondary)
                            Text(item.brand ?? "")
                                .font(.body)
                                .foregroundColor(.primary)
                        }
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
                        .background(ColorConfig.Primary.base) 
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
