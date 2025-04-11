//
//  CoreDataViewController.swift
//  BookXpertAssignment
//
//  Created by Bharat Shilavat on 11/04/25.
//

import UIKit

class CoreDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var coreDataTableView: UITableView!
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coreDataTableView.delegate = self
        coreDataTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        NetworkManager.shared.fetchProducts { result in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    products.forEach { _ in CoreDataManager.shared.saveContext() }
                    self.products = CoreDataManager.shared.fetchProducts()
                    debugPrint("Load data successfully -> \(CoreDataManager.shared.fetchProducts())")
                    self.coreDataTableView.reloadData()
                }
            case .failure(let error):
                
                print("API Error: \(error.localizedDescription)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = product.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        let alert = UIAlertController(title: "Update Product", message: "Enter new name", preferredStyle: .alert)
        alert.addTextField { $0.text = product.name }
        alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { _ in
            if let newName = alert.textFields?.first?.text, !newName.isEmpty {
//                CoreDataManager.shared.updateProduct(product, with: newName)
//                self.products = CoreDataManager.shared.fetchProducts()
//                self.coreDataTableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            CoreDataManager.shared.deleteProduct(product)
            self.products = CoreDataManager.shared.fetchProducts()
            self.coreDataTableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
}
