import Foundation

class DataManager: ObservableObject {
    @Published var fetchedItems: [Item] = []

    func fetchItems(category: String = "Earring", sale: String = "", brand: String = "", name: String = "") {
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
            print("Invalid URL")
            return
        }

        DataFetcher.fetchData(from: url, responseType: [Item].self) { result in
            switch result {
            case .success(let fetchedItems):
                DispatchQueue.main.async {
                    self.fetchedItems = fetchedItems
                }
            case .failure(let error):
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
    }
}
