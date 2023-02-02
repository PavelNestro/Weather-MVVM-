//
//  ViewModelProtocol.swift
//  App(Wather_MVVM)
//
//  Created by Pavel Nesterenko on 26.01.23.
//

import Foundation

protocol ViewModel {
    var weatherModel: WeatherModel? { get set }
    var didUpdateWatherModel: ((WeatherModel) -> Void)? { get set }
//    var didUpdateLocation: ((LocationModel) -> ())? { get set }
//    var didUpdateCurrent: ((CurrentModel) -> ())? { get set }
//    var didUpdateForcastDay: ((Forecast) -> ())? { get set }
    func viewDidload(_ stringForSearch: String)
}
