//
//  AddCityViewModel.swift
//  PSATest
//
//  Created by owee on 14/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import Foundation
import OpenWeatherFramework
import UIKit

final class AddCityViewModel {
    
    private var context = Context.shared
    private var ws = OpenWeatherWS(APIKey: "49e6a41dfca8bdde9592c1272dca877d", Session: URLSession.init(configuration: .default))
    
    private var data : [City] = []
    
    var dataCount : Int {
        return self.data.count
    }
    
    var placeHolderMessage : String {
        return "Enter a city name."
    }
    
    var title : String {
        return "Search a City"
    }
    
    func search(CityName:String, Result: @escaping ((Bool)->())) {
        
        self.ws.weatherTask(CityName: CityName) { (result) in
            
            switch result {

            case .failure(let error):
                
                print(error.localizedDescription)
                DispatchQueue.main.async {Result(false)}
                
            case .success(let reponse):
                            
                DispatchQueue.main.async {
                    // Fetch a City, if the entity doesn't exist create one.
                    let newCity = City.fetch(Name:CityName)
                    newCity.update(Reponse: reponse)
                    
                    self.data.removeAll()
                    self.data.append(newCity)
                    Result(true)
                }
            }
        }
    }
    
    func insertToContext(Index:Int) {
        
        let city = self.data[Index]
        
        // Insert City only if he doesn't exist.
        if false == self.context.cityList.contains(where: {$0.name == city.name}) {
            self.context.cityList.append(city)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
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
    
}
