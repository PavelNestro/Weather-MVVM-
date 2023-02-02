//
//  LocationModel.swift
//  App(Wather_MVVM)
//
//  Created by Pavel Nesterenko on 26.01.23.
//

import Foundation

class LocationModel: Codable {
    let country: String
    let name: String
    let region: String
    let localtime: String
    let lat: Double
    let lon: Double
}
