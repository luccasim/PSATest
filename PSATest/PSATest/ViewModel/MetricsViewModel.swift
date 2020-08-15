//
//  MetricsViewModel.swift
//  PSATest
//
//  Created by owee on 14/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import Foundation

final class MetricsViewModel {
    
    private let context = Context.shared
    
    var data : [(Title:String,Value:String)] = []
    
    init() {
        
        if let city = self.context.selectedCity {
            
            self.data.append((Title:"Lever", Value: city.sunrise.toDate))
            self.data.append((Title:"Coucher", Value: city.sunset.toDate))
            self.data.append((Title:"Humidité", Value: city.humidity.description))
            self.data.append((Title:"Risque de pluie", Value: "-"))
            self.data.append((Title:"Vent", Value: city.windSpeed.description))
            self.data.append((Title:"Ressenti", Value: city.feelslike.toIntDegree))
            self.data.append((Title:"Précipitation", Value: "-"))
            self.data.append((Title:"Pression", Value: city.pressure.description))
            self.data.append((Title:"Visibilité", Value: city.visibility.description))
            self.data.append((Title:"Indice UV", Value: "-"))
            
        }
    }
    
    func getTitle(Index:Int) -> String {
        return self.data[Index].Title
    }
    
    func getValue(Index:Int) -> String {
        return self.data[Index].Value
    }
    
    
}

extension Int64 {
    
    var toDate : String {
        let formater = DateFormatter()
        formater.dateFormat = "HH:mm"
        let time = TimeInterval(self)
        let date = Date(timeIntervalSince1970: time)
        return formater.string(from: date)
    }
}
