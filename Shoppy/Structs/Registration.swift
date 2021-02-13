//
//  Registration.swift
//  Shoppy
//
//  Created by Dilda Ezgi Metincan on 4.02.2021.
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let registration = try? newJSONDecoder().decode(Registration.self, from: jsonData)

import Foundation

// MARK: - Registration
struct Registration: Codable {
    let user: [UserRegister]?
}

// MARK: - User
struct UserRegister: Codable {
    let durum: Bool?
    let mesaj, kullaniciID: String?

    enum CodingKeys: String, CodingKey {
        case durum, mesaj
        case kullaniciID = "kullaniciId"
    }
}
