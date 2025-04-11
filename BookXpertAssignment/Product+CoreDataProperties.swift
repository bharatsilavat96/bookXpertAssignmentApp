//
//  Product+CoreDataProperties.swift
//  
//
//  Created by Bharat Shilavat on 12/04/25.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var productData: ProductData?

}
