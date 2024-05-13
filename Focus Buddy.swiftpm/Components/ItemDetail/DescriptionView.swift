import SwiftUI
struct DescriptionView: View {
    let item: Item

    var body: some View {
        VStack (alignment: .leading) {
            //Title
            Text(item.name)
                .font(.title)
                .fontWeight(.bold)

            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text("...")
                .lineSpacing(8.0)
                .opacity(0.6)

            Text(item.brand)
                    .font(.caption)
                    .fontWeight(.medium)
                    .padding(EdgeInsets(top: 2, leading: 6, bottom: 2, trailing: 6))
                    .background(ColorConfig.Primary.base)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    Spacer()
                    Text(item.sale)
                        .font(.body)
                        .fontWeight(.bold)
            // //Info
            // HStack (alignment: .top) {
            //     VStack (alignment: .leading) {
            //         Text("Size")
            //             .font(.system(size: 16))
            //             .fontWeight(.semibold)
            //         Text("Height: 120 cm")
            //             .opacity(0.6)
            //         Text("Wide: 80 cm")
            //             .opacity(0.6)
            //         Text("Diameter: 72 cm")
            //             .opacity(0.6)
            //     }
                
            //     .frame(maxWidth: .infinity, alignment: .leading)
                
            //     Spacer()
                
            //     VStack (alignment: .leading) {
            //         Text("Treatment")
            //             .font(.system(size: 16))
            //             .fontWeight(.semibold)
            //         Text("Jati Wood, Canvas, \nAmazing Love")
            //             .opacity(0.6)
            //     }
            //     .frame(maxWidth: .infinity, alignment: .leading)
            // }
            // .padding(.vertical)
            
        }
        .padding()
        .padding(.top)
        .padding(.bottom, 30)
        .background(Color("Bg"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
    }
}
