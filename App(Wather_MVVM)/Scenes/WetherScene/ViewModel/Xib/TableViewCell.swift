//
//  TableViewCell.swift
//  App(Wather_MVVM)
//
//  Created by Pavel Nesterenko on 27.01.23.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let identifier = "MassageTableViewCell"
    
    @IBOutlet weak var infoForImageTextlabel: UILabel!
    @IBOutlet weak var temperatureTextLabel: UILabel!

    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var dateTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
