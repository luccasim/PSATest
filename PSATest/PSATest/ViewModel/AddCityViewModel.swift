//
//  AddCityViewModel.swift
//  PSATest
//
//  Created by owee on 14/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import Foundation
import OpenWeatherFramework

final class AddCityViewModel {
    
    private var context = Context.shared
    private var ws = OpenWeatherWS(APIKey: "49e6a41dfca8bdde9592c1272dca877d", Session: URLSession.init(configuration: .default))
    
    var data : [City] = []
    
    func search(CityName:String, Result: @escaping ((Bool)->())) {
        
        let newCity = City.fetch(Name:CityName)
        
        self.ws.weatherTask(CityName: CityName) { (result) in
            
            switch result {

            case .failure(let error):
                
                print(error.localizedDescription)
                DispatchQueue.main.async {Result(false)}
                
            case .success(let reponse):
                            
                DispatchQueue.main.async {
                    newCity.update(Reponse: reponse)
                    self.data.removeAll()
                    self.data.append(newCity)
                    Result(true)
                }
            }
        }
    }
    
    func add(Index:Int) {
        
        let city = self.data[Index]
        
        // Insert City only if he doesn't exist.
        if false == self.context.cityList.contains(where: {$0.name == city.name}) {
            self.context.cityList.append(city)
        }
    }
}
