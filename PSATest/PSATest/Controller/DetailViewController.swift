//
//  DetailViewController.swift
//  PSATest
//
//  Created by owee on 12/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var sepView: UIView!
    
    @IBOutlet weak var informationView: UIView!
    
    let vm = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.mainLabel.text = vm.main
        self.descriptionLabel.text = vm.description
        self.tempLabel.text = vm.temp
        
    }
    
}
