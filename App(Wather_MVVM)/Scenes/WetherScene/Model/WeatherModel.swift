//
//  WetherModel.swift
//  App(Wather_MVVM)
//
//  Created by Pavel Nesterenko on 26.01.23.
//

import Foundation

struct WeatherModel: Codable {
    let location: LocationModel
    let current: CurrentModel
    let forecast: Forecast
}
