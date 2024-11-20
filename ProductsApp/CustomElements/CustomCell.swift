//
//  CustomCell.swift
//  ProductsApp
//
//  Created by  Ivan Kiskyak on 19.11.24.
//

import UIKit

class CustomCell: UITableViewCell {
    private let categoryLabel = UILabel()
    private let scrollView = CustomHorizontalScrollView()
    
    var action: ((Int) -> ())?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(category: ProductCategory) {
        categoryLabel.text = category.title
        scrollView.configure(with: category.products)
        
        scrollView.action = { id in
            self.action?(id)
        }
    }
}

//MARK: - Setting views
private extension CustomCell {
    func setupViews() {
        
        [categoryLabel,
         scrollView].forEach { contentView.addSubview($0) }
        
        categoryLabel.font = .boldSystemFont(ofSize: 20)
    }
}

//MARK: - Setting layout
private extension CustomCell {
    func setupLayout() {
        [categoryLabel,
         scrollView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            scrollView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
