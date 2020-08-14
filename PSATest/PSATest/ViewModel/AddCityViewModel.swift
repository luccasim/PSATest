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
    
    var data : [String] = []
    
    func search(CityName:String, Result: @escaping ((Bool)->())) {
        
        self.ws.weatherTask(CityName: CityName) { (result) in
            
            switch result {

            case .failure(let error):
                
                print(error.localizedDescription)
                DispatchQueue.main.async {Result(false)}
                
            case .success(let reponse):
                
                print(reponse)
                self.data.append(CityName)
                DispatchQueue.main.async {Result(true)}
            }
        }
    }
    
    func add(Index:Int) {
        self.context.cityList.append(self.data[Index])
    }
}
