//
//  TableViewController.swift
//  ProductsApp
//
//  Created by  Ivan Kiskyak on 19.11.24.
//

import UIKit

class TableViewController: UITableViewController {

       private var categories: [ProductCategory] = []
    
    var productManager: IProductManageable!

       override func viewDidLoad() {
           super.viewDidLoad()
           tableView.register(CustomCell.self, forCellReuseIdentifier: "CategoryCell")
           loadData()
       }

       private func loadData() {
           categories = productManager.getCategories()
       }

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           categories.count
       }

       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CustomCell
           let category = categories[indexPath.row]
           cell.configure(with: category)
           cell.action = {  id in
               self.presentDetails(for: id)
           }
           return cell
       }

       private func presentDetails(for id: Int) {
           guard let product = productManager.getProduct(by: id) else { return }
           let detailsVC = DetailsViewController()
           detailsVC.configure(product: product)
           present(detailsVC, animated: true)
       }
}
