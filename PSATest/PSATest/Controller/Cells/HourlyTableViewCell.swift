//
//  HourlyTableViewCell.swift
//  PSATest
//
//  Created by owee on 14/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import UIKit

class HourlyTableViewCell: UITableViewCell {

    @IBOutlet weak var hourCollectionView: UICollectionView! {
        didSet {
            self.hourCollectionView.delegate = self
            self.hourCollectionView.dataSource = self
        }
    }
    
    var data : [Hour] = []
    
}

extension HourlyTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourlyCell", for: indexPath) as? HourlyCollectionViewCell else {
            fatalError()
        }
        
        let hour = self.data[indexPath.row]
        
        cell.hourLabel.text = hour.dt.toDate
        cell.iconImage.image = UIImage(named: hour.icon ?? "01d")
        cell.tempLabel.text = hour.temp.toIntDegree
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60.0, height: 80.0)
    }
    
}
