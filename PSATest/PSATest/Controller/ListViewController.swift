//
//  ListViewController.swift
//  PSATest
//
//  Created by owee on 12/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var townTableView: UITableView!
    @IBOutlet weak var searchButton: UIBarButtonItem!
        
    let vm = ListCityViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.townTableView.delegate = self
        self.townTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.vm.unselectCity()
        self.townTableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let id = segue.identifier
        
        switch id {
        case "pushToDetail":
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
//                vc?.title = self.vm.data[index]
                self.vm.selectCity(Index: index)
            }
        default:    break
        }
    }
}

extension ListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TownCell") as? CityTableViewCell else {
            fatalError("This pattern disappear with SwiftUI!, of course this cell exist...")
        }
        
//        cell.townNameLabel.text = self.vm.data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "pushToDetail", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.vm.removeCity(Index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
