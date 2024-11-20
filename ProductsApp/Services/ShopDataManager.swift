//
//  ShopDataManager.swift
//  ProductsApp
//
//  Created by  Ivan Kiskyak on 17.11.24.
//

import Foundation

protocol IShopDataManageable {
    func getProductsCategories() -> [ProductCategory]
}

class ShopDataManager: IShopDataManageable {
    func getProductsCategories() -> [ProductCategory] {
        [
            ProductCategory(
                title: "Grains and Bread",
                products: [
                    Product(id: 2,
                            title: "Bread",
                            description: "Freshly baked bread with a golden crust and soft texture.",
                            price: 140,
                            imageName: "Bread"),
                    Product(id: 8,
                            title: "Rice",
                            description: "Quick-cooking rice, the ideal side dish for various meals.",
                            price: 90,
                            imageName: "Rice"),
                    Product(id: 9,
                            title: "Pasta",
                            description: "Classic pasta, versatile and easy to cook for a variety of recipes.",
                            price: 120,
                            imageName: "Pasta")
                ]
            ),
            ProductCategory(
                title: "Meat and Poultry",
                products: [
                    Product(id: 6,
                            title: "Chicken",
                            description: "Skinless chicken fillet, rich in protein and easy to digest.",
                            price: 250,
                            imageName: "Chicken"),
                    Product(id: 7,
                            title: "Beef",
                            description: "High-quality beef, perfect for preparing delicious dishes.",
                            price: 350,
                            imageName: "Beef")
                ]
            ),
            ProductCategory(
                title: "Dairy Products",
                products: [
                    Product(id: 1,
                            title: "Milk",
                            description: "Fresh and nutritious dairy product, rich in calcium and vitamin D.",
                            price: 110,
                            imageName: "Milk"),
                    Product(id: 4,
                            title: "Cheese",
                            description: "Natural cheese with a rich flavor, an excellent source of calcium.",
                            price: 290,
                            imageName: "Cheese"),
                    Product(id: 5,
                            title: "Butter",
                            description: "Butter made from natural cream, perfect for baking and cooking.",
                            price: 320, imageName: "Butter"),
                    Product(id: 3,
                            title: "Eggs",
                            description: "Organic eggs, a great source of high-quality protein and healthy fats.",
                            price: 180,
                            imageName: "Eggs")
                ]
            )
        ]
    }
}



