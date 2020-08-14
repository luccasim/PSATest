//
//  AddCityViewController.swift
//  PSATest
//
//  Created by owee on 12/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import UIKit

class AddCityViewController: UIViewController {

    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    let vm = AddCityViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.resultTableView.delegate = self
        self.resultTableView.dataSource = self
        
        self.searchBar.delegate = self
    }
    
}

extension AddCityViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.vm.data.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TownCell") as? CityTableViewCell else {
            fatalError()
        }
        
        cell.townNameLabel.text = self.vm.data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.vm.add(Index: indexPath.row)
        self.navigationController?.popViewController(animated: true)
    }
}

extension AddCityViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if let input = searchBar.text {
            self.vm.search(CityName: input) { (result) in
                self.searchBar.text = nil
                self.resultTableView.reloadData()
            }
        }
    }
}
