//
//  MetricsViewController.swift
//  PSATest
//
//  Created by owee on 14/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import UIKit

class MetricsViewController: UIViewController {

    @IBOutlet weak var metricsTableView: UITableView!
    
    let vm = MetricsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.metricsTableView.dataSource = self
        self.metricsTableView.delegate = self
        
    }
}

extension MetricsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MetricCell") else {
            fatalError()
        }

        cell.textLabel?.text = self.vm.getTitle(Index: indexPath.row)
        cell.detailTextLabel?.text = self.vm.getValue(Index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
}
