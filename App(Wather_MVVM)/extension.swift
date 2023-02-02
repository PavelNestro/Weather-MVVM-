//
//  extension.swift
//  App(Wather_MVVM)
//
//  Created by Pavel Nesterenko on 26.01.23.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadImage(for url: String) {
        guard let url = URL(string: url) else {
            print("invalid url")
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.image = image
                }
                
            }
        
            
            
        }
        task.resume()
        
    }
}
