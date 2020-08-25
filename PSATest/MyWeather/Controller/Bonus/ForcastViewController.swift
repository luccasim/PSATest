//
//  ForcastViewController.swift
//  PSATest
//
//  Created by owee on 14/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import UIKit

class ForcastViewController: UIViewController {

    @IBOutlet weak var forcastTableView: UITableView!
    
    let vm = ForcastViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.forcastTableView.dataSource = self
        self.forcastTableView.delegate = self
    }
}

extension ForcastViewController : UITableViewDataSource, UITableViewDelegate  {
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 6
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        
        switch section {
            
        case 0:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell") as? DayCellTableViewCell else {
                fatalError()
            }
            
            cell.dayLabel.text      = self.vm.day
            cell.tempMaxLabel.text  = self.vm.tempMax
            cell.tempMinLabel.text  = self.vm.tempMin
            
            return cell
            
        case 1:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HourlyCell") as? HourlyTableViewCell else {
                fatalError()
            }
            
            cell.data = self.vm.hourlyData
            
            return cell
            
        case 2:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeekCell") as? WeekTableViewCell else {
                fatalError()
            }
            
            cell.dayLabel.text = self.vm.getDay(Index: indexPath.row)
            cell.iconImage.image = self.vm.getIcon(Index: indexPath.row)
            cell.tempMaxLabel.text = self.vm.getTempMax(Index: indexPath.row)
            cell.tempMinLabel.text = self.vm.getTempMin(Index: indexPath.row)
                        
            return cell
            
        default:    return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let section = indexPath.section
        
        switch section {
        case 0,2:
            return CGFloat(60)
        case 1:
            return CGFloat(90)
        default:
            return 0
        }
    }
}
