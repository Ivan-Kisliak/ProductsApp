//
//  ViewController.swift
//  ProductsApp
//
//  Created by  Ivan Kiskyak on 17.11.24.
//

import UIKit

class ViewController: UIViewController {
    
    var productManager: IProductManageable!
    private let horizontalScroll = CustomHorizontalScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        horizontalScroll.configure(with: productManager.getAllProducts()) // Набиваем стек элементами.
        horizontalScroll.action = presentDetailVC
        view.addSubview(horizontalScroll)
        setupLayout()
    }
    
    private func presentDetailVC(id: Int) {
        guard let product = getProduct(id) else { return }
        let detailsVC = DetailsViewController()
        detailsVC.configure(product: product)
        present(detailsVC, animated: true)
    }
    
    private func getProduct(_ id: Int) -> Product? {
        for product in productManager.getAllProducts() {
            if product.id == id {
                return product
            }
        }
        return nil
    }
}

extension ViewController {
    private func setupLayout() {
        horizontalScroll.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            horizontalScroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            horizontalScroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            horizontalScroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            horizontalScroll.heightAnchor.constraint(equalToConstant: 200) // обязательно определяем высоту стека.
        ])
    }
}




