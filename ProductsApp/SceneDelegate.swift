//
//  SceneDelegate.swift
//  ProductsApp
//
//  Created by  Ivan Kiskyak on 17.11.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windewScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windewScene)
        
        let tableViewController = TableViewController()
        
        tableViewController.productManager = buildProductManager()

        window?.rootViewController = tableViewController
        window?.makeKeyAndVisible()
    }
}

extension SceneDelegate {
    func buildProductManager() -> IProductManageable {
        let shopDataManager: IShopDataManageable = ShopDataManager()
        let productManager = ProductManager()
        
        let categories = shopDataManager.getProductsCategories()
        
        productManager.addCategories(categories)
        
        return productManager
    }
}




