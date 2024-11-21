//
//  TableViewController.swift
//  ProductsApp
//
//  Created by  Ivan Kiskyak on 19.11.24.
//

import UIKit

class TableViewController: UITableViewController {
    
    private let cellIdentifier = "cellIdentifier"
    
    var productManager: IProductManageable?
    
//MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productManager?.getCategories().count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as? CustomCell else {
            return UITableViewCell()
        }
        
        if let category = productManager?.getCategories()[indexPath.row] {
            cell.configure(category: category)
            cell.action = {  id in
                self.presentDetails(for: id)
            }
            cell.selectionStyle = .none
        }
        return cell
    }
    
    private func presentDetails(for id: Int) {
        guard let product = productManager?.getProduct(by: id) else { return }
        
        let detailsVC = DetailsViewController()
        detailsVC.configure(product: product)
        
        present(detailsVC, animated: true)
    }
}
