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
                      VStack(alignment: .leading, spacing: 😎 {
                            Text(item.name.prefix(maxNameLength))
                                .font(.body)
                                .lineLimit(1) // Ensure only one line is displayed
                                .truncationMode(.tail) // Add an ellipsis (...) if the name exceeds the limit
                            Text("฿ ")
                              .foregroundColor(.secondary) + 
                            Text(item.sale ?? "")
                                .foregroundColor(.secondary)
                            Text(item.brand ?? "")
                              .font(.caption)
                              .fontWeight(.medium)
                              .padding(EdgeInsets(top: 2, leading: 6, bottom: 2, trailing: 6))
                              .background(ColorConfig.Primary.base)
                              .foregroundColor(.white)
                              .cornerRadius(😎
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
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(ColorConfig.Primary.base) 
                        .foregroundColor(Color.white)
                        .cornerRadius(😎
                        .padding(.horizontal, 20)
                }
                .padding(.vertical)
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