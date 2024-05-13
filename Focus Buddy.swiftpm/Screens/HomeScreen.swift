import SwiftUI

struct HomeScreen: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    @State private var isFetchingData = true
    @State private var errorMessage = ""
    
    private let categories = ["All", "Bracelet", "Necklace", "Earring", "Glasses"]

    var body: some View {
            if isFetchingData {
                Text("Loading...")
                    .padding()
                    .onAppear {
                        fetchData()
                    }
            } else if !errorMessage.isEmpty {
                Text(errorMessage)
                    .padding()
            } else {
            NavigationView {
                ZStack {
                    Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                        .ignoresSafeArea()
                    
                    ScrollView (showsIndicators: false) {
                        VStack (alignment: .leading) {
                            
                            AppBarView()
                            
                            TagLineView()
                                .padding()
                            
                            SearchAndScanView(search: $search)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0 ..< categories.count) { i in
                                        Button(action: {selectedIndex = i}) {
                                            CategoryView(isActive: selectedIndex == i, text: categories[i])
                                        }
                                    }
                                }
                                .padding()
                            }
                            
                            Text("Popular")
                                .font(.custom("PlayfairDisplay-Bold", size: 24))
                                .padding(.horizontal)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack (spacing: 0) {
                                    ForEach(0 ..< 4) { i in
                                        NavigationLink(
                                            destination: DetailScreen(),
                                            label: {
                                                ProductCardView(image: Image("chair_\(i+1)"), size: 210)
                                            })
                                            .navigationBarHidden(true)
                                            .foregroundColor(.black)
                                    }
                                    .padding(.leading)
                                }
                            }
                            .padding(.bottom)
                            
                            Text("Best")
                                .font(.custom("PlayfairDisplay-Bold", size: 24))
                                .padding(.horizontal)
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                HStack (spacing: 0) {
                                    ForEach(0 ..< 4) { i in
                                        ProductCardView(image: Image("chair_\(4-i)"), size: 180)
                                    }
                                    .padding(.leading)
                                }
                            }
                            
                        }
                    }
                    
                    VStack {
                        Spacer()
                        BottomNavBarView()
                    }
                }
            }
        }
    }
    
    func fetchData() {
        guard let url = URL(string: Endpoint.baseURL + Endpoint.Path.testApi) else {
            self.errorMessage = "Invalid URL"
            print("Invalid URL")
            self.isFetchingData = false
            return
        }
        
        DataFetcher.fetchData(from: url, responseType: MessageResponse.self) { result in
            switch result {
            case .success(let decodedData):
                DispatchQueue.main.async {
                    self.isFetchingData = false
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.errorMessage = "Server unavailable"
                    self.isFetchingData = false
                }
            }
        }
    }


}

// struct HomeScreen_Previews: PreviewProvider {
//     static var previews: some View {
//         HomeScreen()
//     }
// }



struct MessageResponse: Codable {
    let message: String
}
