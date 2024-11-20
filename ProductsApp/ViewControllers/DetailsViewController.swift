//
//  DetailsViewController.swift
//  ProductsApp
//
//  Created by  Ivan Kiskyak on 19.11.24.
//

import UIKit

class DetailsViewController: UIViewController {

    private let imageProduct = UIImageView()
    private let descritionLabel = UILabel()
    private let priceLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(imageProduct)
        view.addSubview(descritionLabel)
        view.addSubview(priceLabel)
        
        setupLabel()
        setupLayout()
        setupPriceLabel()
    }
    
    func configure(product: Product?) {
        if let product {
            descritionLabel.text = product.description
            imageProduct.image = UIImage(named: product.imageName)
            priceLabel.text = "\(product.price)₽"
        }
    }
}

extension DetailsViewController {
    private func setupLabel() {
        descritionLabel.textAlignment = .center
        descritionLabel.font = UIFont.systemFont(ofSize: 16)
    }
    
    private func setupImage() {
        imageProduct.layer.cornerRadius = 20
        imageProduct.clipsToBounds = true
    }
    
    private func setupPriceLabel() {
        priceLabel.font = UIFont.boldSystemFont(ofSize: 22)
    }
    
    private func setupLayout() {
        descritionLabel.translatesAutoresizingMaskIntoConstraints = false
        imageProduct.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageProduct.widthAnchor.constraint(equalToConstant: 200),
            imageProduct.heightAnchor.constraint(equalToConstant: 200),
            imageProduct.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageProduct.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            
            descritionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descritionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            priceLabel.topAnchor.constraint(equalTo: descritionLabel.bottomAnchor, constant: 20)
        ])
    }
}
