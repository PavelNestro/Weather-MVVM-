//
//  ForecastDay.swift
//  App(Wather_MVVM)
//
//  Created by Pavel Nesterenko on 27.01.23.
//

import Foundation

class ForecastDay: Codable {
    let day: Day
    let date: String
    let hour: [Hour]
}
