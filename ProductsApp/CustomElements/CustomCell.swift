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
        }

        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func configure(with category: ProductCategory) {
            categoryLabel.text = category.title
            scrollView.configure(with: category.products)
            
            scrollView.action = { id in
                self.action?(id)
            }
        }

        private func setupViews() {
            contentView.addSubview(categoryLabel)
            contentView.addSubview(scrollView)

            categoryLabel.font = .boldSystemFont(ofSize: 20)
            categoryLabel.translatesAutoresizingMaskIntoConstraints = false
            scrollView.translatesAutoresizingMaskIntoConstraints = false

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
