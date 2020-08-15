//
//  ListCityViewModel.swift
//  PSATest
//
//  Created by owee on 14/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import Foundation
import UIKit
import OpenWeatherFramework

class ListCityViewModel {
    
    private var context = Context.shared
    private var ws = OpenWeatherWS(APIKey: "49e6a41dfca8bdde9592c1272dca877d", Session: URLSession.init(configuration: .default))
    
    var data : [City] {
        return context.cityList
    }
    
    func unselectCity() {
        self.context.selectedCity = nil
    }
    
    func selectCity(Index:Int) {
        self.context.selectedCity = self.data[Index]
    }
    
    func removeCity(Index:Int) {
        self.context.cityList.remove(at: Index)
    }
    
    func saveContext() {
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    private var group = DispatchGroup()
    
    func fetchForcast(City:City) {
        
        self.group.enter()
        
        print("Start fetch \(City.name!)")
        
        self.ws.oneCallTask(Coordinates: (Lon: City.lon, Lat: City.lat)) { (result) in
            
            switch result {
            case .failure(let error): print(error.localizedDescription)
            case .success(let reponse): City.update(OneCallReponse: reponse)
            }
            
            self.group.leave()
            print("End fecth \(City.name!)")
        }
    }
    
    func updates(Complete:@escaping ()->()) {
        
        self.data.forEach { (City) in
            self.fetchForcast(City: City)
        }
        
        self.group.notify(queue: .main) {
            print("Finish")
            Complete()
        }
    }
    
}
