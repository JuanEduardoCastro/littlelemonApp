//
//  MenuItemModel.swift
//  littlelemonApp
//
//  Created by prueba on 19/03/2023.
//

import Foundation

struct MenuItemModel: Decodable, Hashable {
    enum CodingKeys: String, CodingKey { case
        title, price, image, category,
        itemDescription = "description"
    }
    
    let title: String
    let price: String
    let image: String
    let category: String
    let itemDescription: String
}
