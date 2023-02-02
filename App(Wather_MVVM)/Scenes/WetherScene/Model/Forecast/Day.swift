//
//  Day.swift
//  App(Wather_MVVM)
//
//  Created by Pavel Nesterenko on 27.01.23.
//

import Foundation

class Day: Codable {
    var maxTempC: Double
    var minTempC: Double
    let condition: Condition
    
    enum CodingKeys: String, CodingKey {
        case maxTempC = "maxtemp_c"
        case minTempC = "mintemp_c"
        case condition = "condition"
        
    }
}
