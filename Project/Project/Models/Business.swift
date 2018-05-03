//
//  Business.swift
//  Project
//
//  Created by William Cisneros on 01/05/2018.
//  Copyright © 2018 William Cisneros. All rights reserved.
//

import Foundation

public struct Business: Codable {
    var id: String
    var name: String
    var coordinates: Coordonates
}

public struct Coordonates: Codable {
    var latitude: Double
    var longitude: Double
}
