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
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
    }
    
//MARK: - Life cycle
    func configure(product: Product?) {
        if let product {
            imageProduct.image = UIImage(named: product.imageName)
            descritionLabel.text = product.description
            priceLabel.text = "\(product.price)₽"
        }
    }
}

//MARK: - Setting views
private extension DetailsViewController {
    func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        
        setupImageProduct()
        setupDescritionLabel()
        setupPriceLabel()
        setupStackView()
    }
    
    func setupDescritionLabel() {
        descritionLabel.numberOfLines = 0
        descritionLabel.font = UIFont.systemFont(ofSize: 16)
    }
    
    func setupImageProduct() {
        imageProduct.layer.cornerRadius = 20
        imageProduct.clipsToBounds = true
    }
    
    func setupPriceLabel() {
        priceLabel.font = UIFont.boldSystemFont(ofSize: 24)
        priceLabel.textAlignment = .center
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 20
        
        [imageProduct,
         descritionLabel,
         priceLabel].forEach { stackView.addArrangedSubview($0) }
    }
}

//MARK: - Setup layout
private extension DetailsViewController {
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 250),

            imageProduct.heightAnchor.constraint(equalTo: stackView.widthAnchor)

        ])
    }
}
