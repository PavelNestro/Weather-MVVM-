//
//  ViewController.swift
//  App(Wather_MVVM)
//
//  Created by Pavel Nesterenko on 26.01.23.
//

import UIKit

class WeatherViewController: UIViewController {
    var viewModel: ViewModelImplementation?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchCity: UISearchBar!
    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tempCTextLabel: UILabel!
    @IBOutlet weak var infoTextLabel: UILabel!
    @IBOutlet weak var feelsLikeTextLabel: UILabel!
    @IBOutlet weak var windTextLabel: UILabel!
    var cellSize: CGSize {
        var minimumLineSpacing: CGFloat = 0
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
        minimumLineSpacing = flowLayout.minimumLineSpacing
        }
        let width = (collectionView.frame.width - minimumLineSpacing) / 3.8
        return CGSize(width: width, height: width + 5)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModelImplementation(self)
        searchCity.delegate = self
        tableView.dataSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib =  UINib(nibName: String(describing: TableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TableViewCell.identifier)
        viewModel?.viewDidload("Gomel")
        swipeHorizontal()
        viewModel?.didUpdateWatherModel = { weather in
            self.cityTextLabel.text = weather.location.name
            self.tempCTextLabel.text = "\(weather.current.tempC)°"
            self.feelsLikeTextLabel.text = "Feels like: \(weather.current.feelsLike)°"
            self.windTextLabel.text = "Wind: \(weather.current.wind)kp/h"
            self.infoTextLabel.text = weather.current.condition.text
            self.imageView.downloadImage(for: "https:\(weather.current.condition.icon)")
            self.tableView.reloadData()
            self.collectionView.reloadData()
        }
        
    }
    func swipeHorizontal() {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            collectionView.isPagingEnabled = true
            print("swipe horizontal")
        }
        
    }
}

extension WeatherViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchBar = searchBar.text {
            viewModel?.viewDidload(searchBar)
        }
    }
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.weatherModel?.forecast.forecastday.map({$0.day}).count ?? 0
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell else {
            return UITableViewCell()
        }

        if let array = viewModel?.weatherModel?.forecast.forecastday {
            let arrayDate = array.map({$0.date})
            let arrayTempMax = array.map({$0.day.maxTempC})
            let arrayTempMin = array.map({$0.day.minTempC})
            let arrayImageIcon = array.map({$0.day.condition.icon})
            cell.temperatureTextLabel.text = "Min: \(arrayTempMin[indexPath.row])° Max: \(arrayTempMax[indexPath.row])°"
            cell.imageViewCell.downloadImage(for: "https:\(arrayImageIcon[indexPath.row])")
            cell.dateTextLabel.text = "\(arrayDate[indexPath.row])"
            
        }
        
        return cell
    }
    
    
}

extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let array = viewModel?.weatherModel?.forecast.forecastday {
            let arrayTempC = array.map({$0.hour.map({$0.tempC})}).first!
            let imageArray = array.map({$0.hour.map({$0.condition.icon})}).first!
            let arrayTime = array.map({$0.hour.map({$0.time})}).first!
            let arrayHours = [24]
            print(arrayHours.count)
            cell.hourTextLabel.text = "\(arrayTime[indexPath.row])"
            cell.tempCTextLabel.text = "\(arrayTempC[indexPath.row])"
            cell.imageView.downloadImage(for: "https:\(imageArray[indexPath.row])")
        }
        return cell
    }
    
    
}
extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
