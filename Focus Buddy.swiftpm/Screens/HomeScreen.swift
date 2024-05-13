import SwiftUI

struct HomeScreen: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    @State private var isFetchingData = true
    @State private var errorMessage = ""

    @StateObject private var dataManager = DataManager()

    @State private var NecklaceItems: [Item] = []
    @State private var EarringItems: [Item] = []
    


    private let categories = ["All", "Bracelet", "Necklace", "Earring", "Glasses"]

    var body: some View {
            if isFetchingData {
                Text("Loading...")
                    .padding()
                    .onAppear {
                        CheckApiAvailable()
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
                            
                            Text("Bracelet")
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
                            
                            Text("Necklace")
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
                    }.padding(.top, 20)
                    
                    VStack {
                        Spacer()
                        // BottomNavBarView()
                    }
                }
            }
        }
    }
    
    func CheckApiAvailable() {
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


    func fetchItemData(category: String = "", items: inout [Item], sale: String = "", brand: String = "", name: String = "") {
        var components = URLComponents(string: Endpoint.baseURL + Endpoint.Path.getItems)!
        
        if !category.isEmpty {
            components.queryItems?.append(URLQueryItem(name: "category", value: category))
        }
        if !sale.isEmpty {
            components.queryItems?.append(URLQueryItem(name: "sale", value: sale))
        }
        if !brand.isEmpty {
            components.queryItems?.append(URLQueryItem(name: "brand", value: brand))
        }
        if !name.isEmpty {
            components.queryItems?.append(URLQueryItem(name: "name", value: name))
        }

        guard let url = components.url else {
            self.errorMessage = "Invalid URL"
            print("Invalid URL")
            return
        }

        DataFetcher.fetchData(from: url, responseType: [Item].self) { result in
            switch result {
            case .success(let fetchedItems):
                DispatchQueue.main.async {
                    items = fetchedItems
                    self.isFetchingData = false
                }
            case .failure(let error):
                print("Error fetching data: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to fetch data"
                    self.isFetchingData = false
                }
            }
        }
    }

    func fetchNecklaceItems() {
        fetchItemData(category: "Necklace", items: &NecklaceItems)
    }

    func fetchEarringItems() {
        fetchItemData(category: "Earring", items: &EarringItems)
    }


    


}

