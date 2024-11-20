//
//  CustomHorizontalScrollView.swift
//  ProductsApp
//
//  Created by  Ivan Kiskyak on 17.11.24.
//

import UIKit

class CustomHorizontalScrollView: UIView {
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    var action: ((Int) -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupScrollView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with products: [Product]) {
        for product in products {
            let view = CustomView(product: product)
            view.action = {
                self.tapView($0)
            }
            stackView.addArrangedSubview(view)
        }
    }
    
    private func tapView(_ id: Int) {
        action?(id)
    }
}

//MARK: - Setting views
private extension CustomHorizontalScrollView {
    func setupView() {
        scrollView.addSubview(stackView)
        
        addSubview(scrollView)
        
        setupStackView()
    }
    
    func setupStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 10
    }
}

//MARK: - Setting layout
private extension CustomHorizontalScrollView {
    func setupScrollView() {
        [scrollView,
         stackView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}


