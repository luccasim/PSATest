//
//  CityTableViewCell.swift
//  PSATest
//
//  Created by owee on 12/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherImage: UIImageView! {
        didSet {
            self.weatherImage.image = UIImage(named: "01d")
        }
    }
    
    @IBOutlet weak var townNameLabel: UILabel!
    @IBOutlet weak var townTempLabel: UILabel!
    

}
