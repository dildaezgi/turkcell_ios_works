//
//  Order.swift
//  Shoppy
//
//  Created by Dilda Ezgi Metincan on 4.02.2021.
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let order = try? newJSONDecoder().decode(Order.self, from: jsonData)

import Foundation

// MARK: - Order
struct Order: Codable {
    let order: [OrderElement]
}

// MARK: - OrderElement
struct OrderElement: Codable {
    let durum: Bool
    let mesaj: String
}
