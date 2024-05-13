import SwiftUI
struct TagLineView: View {
    var body: some View {
        Text("Find your \nLuxury ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(ColorConfig.Primary.base)
            + Text("accessories!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundColor(ColorConfig.Primary.base)
    }
}