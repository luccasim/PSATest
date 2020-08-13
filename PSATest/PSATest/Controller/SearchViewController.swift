//
//  SearchViewController.swift
//  PSATest
//
//  Created by owee on 12/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var data : [String] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.resultTableView.delegate = self
        self.resultTableView.dataSource = self
        
        self.searchBar.delegate = self
    }
    
}

extension SearchViewController : UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if let text = searchBar.text, text.count > 3 {
            self.data.append(text)
            self.resultTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.data.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TownCell") as? TownTableViewCell else {
            fatalError()
        }
        
        cell.townNameLabel.text = self.data[indexPath.row]
        
        return cell
    }
    

}
