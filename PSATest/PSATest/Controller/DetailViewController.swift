//
//  DetailViewController.swift
//  PSATest
//
//  Created by owee on 12/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var sepView: UIView!
    
    @IBOutlet weak var informationsCollectionView: UICollectionView!
    
    @IBOutlet weak var informationFlowLayout: UICollectionViewFlowLayout!
    
    var data : [String] = ["weekly", "informations"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

}
