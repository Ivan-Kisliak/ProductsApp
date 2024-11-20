//
//  ProductManager.swift
//  ProductsApp
//
//  Created by  Ivan Kiskyak on 17.11.24.
//

protocol IProductManageable {
    func addCategories(_ categories: [ProductCategory])
    func getCategories() -> [ProductCategory]
    func getAllProducts() -> [Product]
    func getProduct(by id: Int) -> Product?
}

class ProductManager: IProductManageable {
    private var categories: [ProductCategory] = []

    func addCategories(_ categories: [ProductCategory]) {
        self.categories = categories
    }
    
    func getCategories() -> [ProductCategory] {
        categories
    }
    
    func getAllProducts() -> [Product] {
        categories.flatMap { $0.products }
    }
    
    func getProduct(by id: Int) -> Product? {
        for category in categories {
            if let product = category.products.first(where: { $0.id == id }) {
                return product
            }
        }
        return nil
    }
}

