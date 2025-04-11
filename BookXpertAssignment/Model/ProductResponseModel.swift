//
//  ProductResponseModel.swift
//  BookXpertAssignment
//
//  Created by Bharat Shilavat on 11/04/25.
//

import Foundation

struct ProductModel: Codable {
    let id: String?
    let name: String?
    let data: ProductDataModel?

    enum CodingKeys: CodingKey {
        case id
        case name
        case data
    }
}

struct ProductDataModel: Codable {
    let color: String?
    let capacity: String?
    let capacityGB: Int?
    let price: Double?
    let generation: String?
    let year: Int?
    let cpuModel: String?
    let hardDiskSize: String?
    let strapColour: String?
    let caseSize: String?
    let description: String?
    let screenSize: Float?
    let generationInt: String?
    let priceString: String?

    private enum CodingKeys: String, CodingKey {
        case color
        case capacity
        case capacityGB = "capacity GB"
        case price
        case generation
        case year
        case cpuModel = "CPU model"
        case hardDiskSize = "Hard disk size"
        case strapColour = "Strap Colour"
        case caseSize = "Case Size"
        case description = "Description"
        case screenSize = "Screen size"
        case generationInt = "Generation"
        case priceString = "Price"
    }
}
