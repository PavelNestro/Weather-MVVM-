//
//  Hour.swift
//  App(Wather_MVVM)
//
//  Created by Pavel Nesterenko on 1.02.23.
//

import Foundation

class Hour: Codable {
    var time: String
    var tempC: Double
    var condition: HourCondition
    
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case tempC = "temp_c"
        case condition = "condition"
        
    }
}
