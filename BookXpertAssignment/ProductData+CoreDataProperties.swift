//
//  ProductData+CoreDataProperties.swift
//  
//
//  Created by Bharat Shilavat on 12/04/25.
//
//

import Foundation
import CoreData


extension ProductData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductData> {
        return NSFetchRequest<ProductData>(entityName: "ProductData")
    }

    @NSManaged public var color: String?
    @NSManaged public var capacity: String?
    @NSManaged public var capacityGB: Double
    @NSManaged public var price: Double
    @NSManaged public var generation: String?
    @NSManaged public var year: Int16
    @NSManaged public var cpuModel: String?
    @NSManaged public var hardDiskSize: String?
    @NSManaged public var strapColor: String?
    @NSManaged public var caseSize: String?
    @NSManaged public var deviceDescription: String?
    @NSManaged public var screenSize: Float
    @NSManaged public var generationInt: String?
    @NSManaged public var priceString: String?

}
