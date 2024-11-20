//
//  TableViewController.swift
//  ProductsApp
//
//  Created by  Ivan Kiskyak on 19.11.24.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var categories: [ProductCategory] = []
    
    private let cellIdentifier = "cellIdentifier"
    
    var productManager: IProductManageable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        if let categories = productManager?.getCategories() {
            self.categories = categories
        }
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as? CustomCell else {
            return UITableViewCell()
        }
        
        let category = categories[indexPath.row]
        cell.configure(category: category)
        cell.action = {  id in
            self.presentDetails(for: id)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    private func presentDetails(for id: Int) {
        guard let product = productManager?.getProduct(by: id) else { return }
        
        let detailsVC = DetailsViewController()
        detailsVC.configure(product: product)
        
        present(detailsVC, animated: true)
    }
}
