import Foundation

struct Item: Codable, Hashable {
    let _id: String?
    let name: String
    let sale: String?
    let brand: String?
    let img: String?
    let link1: String?
    let link2: String?
    let link3: String?
    let link4: String?
    let category: String?
    let link1img: String?
    let link2img: String?
    let link3img: String?
    let link4img: String?
    let description: String?
    let views: String?

    init(_id: String? = nil, name: String, sale: String? = nil, brand: String? = nil, img: String? = nil, link1: String? = nil, link2: String? = nil, link3: String? = nil, link4: String? = nil, category: String? = nil, link1img: String? = nil, link2img: String? = nil, link3img: String? = nil, link4img: String? = nil, description: String? = nil, views: String? = nil) {
        self._id = _id
        self.name = name
        self.sale = sale
        self.brand = brand
        self.img = img
        self.link1 = link1
        self.link2 = link2
        self.link3 = link3
        self.link4 = link4
        self.category = category
        self.link1img = link1img
        self.link2img = link2img
        self.link3img = link3img
        self.link4img = link4img
        self.description = description
        self.views = views
    }
}
