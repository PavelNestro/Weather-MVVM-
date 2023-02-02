//
//  CurrentModel.swift
//  App(Wather_MVVM)
//
//  Created by Pavel Nesterenko on 26.01.23.
//

import Foundation

class CurrentModel: Codable {
    let tempC: Double
    let condition: ConditionModel
    let wind: Double
    let feelsLike: Double
    
    
    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case condition = "condition"
        case wind = "wind_kph"
        case feelsLike = "feelslike_c"
    }
}
