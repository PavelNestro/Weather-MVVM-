//
//  CustomCollectionViewCell.swift
//  App(Wather_MVVM)
//
//  Created by Pavel Nesterenko on 1.02.23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tempCTextLabel: UILabel!
    @IBOutlet weak var hourTextLabel: UILabel!
    static let identifier = String(describing: CustomCollectionViewCell.self)
}
