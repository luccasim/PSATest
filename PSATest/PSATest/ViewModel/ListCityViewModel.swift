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
    
    private var data : [City] {
        return context.cityList
    }
    
    var title : String {
        return "Cities"
    }
    
    var dataCount : Int {
        return self.data.count
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
    
    func nameFor(Index:Int) -> String {
        return self.data[Index].name ?? ""
    }
    
    func temperatureFor(Index:Int) -> String {
        return self.data[Index].temperature.toInt
    }
    
    func iconFor(Index:Int) -> UIImage? {
        return UIImage(named: self.data[Index].icon ?? "01d")
    }
    
    private var group = DispatchGroup()
    
    func fetchForcast(City:City) {
        
        self.group.enter()
                
        self.ws.oneCallTask(Coordinates: (Lon: City.lon, Lat: City.lat)) { (result) in
            
            switch result {
            case .failure(let error): print(error.localizedDescription)
            case .success(let reponse): City.update(OneCallReponse: reponse)
            }
            
            self.group.leave()
        }
    }
    
    func updates(Complete:@escaping ()->()) {
        
        self.data.forEach { (City) in
            self.fetchForcast(City: City)
        }
        
        self.group.notify(queue: .main) {
            Complete()
        }
    }
    
}
