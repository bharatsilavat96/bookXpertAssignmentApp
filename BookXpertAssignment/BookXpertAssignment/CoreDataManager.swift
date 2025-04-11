//
//  CoreDataManager.swift
//  BookXpertAssignment
//
//  Created by Bharat Shilavat on 11/04/25.
//

import Foundation
import UIKit
import CoreData


class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BookXpertAssignment")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Failed saving context: \(error)")
            }
        }
    }
    
    func fetchProducts() -> [Product] {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Fetch error: \(error)")
            return []
        }
    }
    
    func deleteProduct(_ product: Product) {
        context.delete(product)
        saveContext()
    }
    
    func updateProduct(_ product: Product, with model: ProductModel) {
        product.name = model.name
        product.id = model.id
        
        if let data = model.data {
            let productData = product.productData ?? ProductData(context: context)
            productData.color = data.color
            productData.capacity = data.capacity
            productData.capacityGB = Double(Int16(data.capacityGB ?? 0))
            productData.price = data.price ?? 0
            productData.generation = data.generation
            productData.year = Int16(data.year ?? 0)
            productData.cpuModel = data.cpuModel
            productData.hardDiskSize = data.hardDiskSize
            productData.strapColor = data.strapColour
            productData.caseSize = data.caseSize
            productData.deviceDescription = data.description
            productData.screenSize = data.screenSize ?? 0
            productData.generationInt = data.generationInt
            productData.priceString = data.priceString
            
            product.productData = productData
        }
        
        saveContext()
    }
    
    func createProduct(from model: ProductModel) {
        let product = Product(context: context)
        updateProduct(product, with: model)
    }
}
