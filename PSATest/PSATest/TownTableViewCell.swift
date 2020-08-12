//
//  TownTableViewCell.swift
//  PSATest
//
//  Created by owee on 12/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import UIKit

class TownTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var townNameLabel: UILabel!
    @IBOutlet weak var townTempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
