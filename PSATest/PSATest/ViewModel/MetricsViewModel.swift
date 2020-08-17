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
            
            self.data.append((Title:"Sunrise", Value: city.sunrise.toDate))
            self.data.append((Title:"Sunset", Value: city.sunset.toDate))
            self.data.append((Title:"Humidity", Value: city.humidity.description))
            self.data.append((Title:"Wind Speed", Value: city.windSpeed.description + " m/s"))
            self.data.append((Title:"Feels like", Value: city.feelslike.toIntDegree))
            self.data.append((Title:"Pressure", Value: city.pressure.description))
            self.data.append((Title:"Visibilité", Value: city.visibility.toInt + " m"))
            self.data.append((Title:"Clouds", Value: city.clouds.description + " %"))
            self.data.append((Title:"UVI", Value: city.uvi.description))
            
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
