//
//  CustomView.swift
//  ProductsApp
//
//  Created by  Ivan Kiskyak on 17.11.24.
//

import UIKit

class CustomView: UIView {
    
    private var product: Product?
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    private let imageProduct = UIImageView()
    
    
    var action: ((Int) -> ())?
    
    init(product: Product) {
        super.init(frame: .zero)
        self.product = product
        configure(product: product)
        setupViews()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(product: Product) {
        titleLabel.text = product.title
        imageProduct.image = UIImage(named: product.imageName)
        descriptionLabel.text = product.description
        priceLabel.text = "\(product.price)₽"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let product {
            action?(product.id)
        }
    }
}

//MARK: - Settings View
private extension CustomView {
    func setupViews() {
        backgroundColor = UIColor(cgColor: CGColor(red: 230/255,
                                                   green: 230/255,
                                                   blue: 250/255,
                                                   alpha: 1))
        layer.cornerRadius = 20
        
        setupShadow()
        setupTitleLabel()
        setupImage()
        setupDescription()
        setupPriceLabel()
        
        addSubviews()
    }
    
    func addSubviews() {
        [titleLabel,
         descriptionLabel,
         priceLabel,
         imageProduct].forEach { addSubview($0) }
    }
    
    func setupShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 10
    }
    
    func setupTitleLabel() {
        titleLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    func setupImage() {
        imageProduct.layer.cornerRadius = 10
        imageProduct.clipsToBounds = true
        imageProduct.contentMode = .scaleAspectFill
    }
    
    func setupDescription() {
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.numberOfLines = 0
    }
    
    func setupPriceLabel() {
        priceLabel.font = .systemFont(ofSize: 24)
    }
    
}

//MARK: - Setting Layuot
private extension CustomView {
    func setupLayout() {
        [titleLabel,
         descriptionLabel,
         priceLabel,
         imageProduct
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 280),
            heightAnchor.constraint(equalToConstant: 160),
            
            imageProduct.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageProduct.topAnchor.constraint(equalTo:  topAnchor, constant: 16),
            imageProduct.widthAnchor.constraint(equalToConstant: 100),
            imageProduct.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageProduct.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo:  topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo:  trailingAnchor, constant: -4),
            descriptionLabel.bottomAnchor.constraint(equalTo: imageProduct.bottomAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}

