//
//  WeatherViewModel.swift
//  App(Wather_MVVM)
//
//  Created by Pavel Nesterenko on 26.01.23.
//

import Foundation
import UIKit

class ViewModelImplementation: ViewModel {
    var didUpdateWatherModel: ((WeatherModel) -> Void)?
    
    var weatherModel: WeatherModel? {
        didSet {
            if let weatherModel = weatherModel {
                print(weatherModel.forecast.forecastday.count)
                DispatchQueue.main.async {
                    self.didUpdateWatherModel?(weatherModel)
                }
            }
        }
    }
    
    weak var viewController: WeatherViewController?
    
    func viewDidload(_ stringForSearch: String) {
        let url = "https://api.weatherapi.com/v1/forecast.json?key=da2e7f2906f041f185d152213232401&q=\(stringForSearch)&days=7&aqi=no&alerts=no"
                    guard let url = URL(string: url) else {
                        print("invalid url")
                        return
                    }
                    let request = URLRequest(url: url)
                    let task = URLSession.shared.dataTask(with: request) { data, _, error in
                        if let error = error {
                            print(error.localizedDescription)
                        }
                        guard let data = data else {
                            print("no data in response")
                            return
                        }
                        if let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {

                            print(dict)

                        }
                        if let weather = try?JSONDecoder().decode(WeatherModel.self, from: data) {
                            DispatchQueue.main.async {
                                self.weatherModel = weather
                            }

                        }
                    }
                    task.resume()
            }

    init(_ viewController: WeatherViewController) {
        self.viewController = viewController
    }
    
}

