//
//  Hour.swift
//  PSATest
//
//  Created by owee on 15/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import Foundation
import CoreData
import OpenWeatherFramework

class Hour : NSManagedObject {
    
    func set(OneCallReponse reponse:OpenWeatherWS.OneCallReponse.Hourly) {
        
        self.clouds     = Int64(reponse.clouds)
        self.desc       = reponse.weather[0].description
        self.dewPoint   = reponse.dewPoint
        self.dt         = Int64(reponse.dt)
        self.feelslike  = reponse.feelsLike
        self.humidity   = Int64(reponse.humidity)
        self.icon       = reponse.weather[0].icon
        self.id         = Int64(reponse.weather[0].id)
        self.main       = reponse.weather[0].main
        self.pop        = Int64(reponse.pop)
        self.pressure   = Int64(reponse.pressure)
        self.temp       = reponse.temp
        self.visibility = Int64(reponse.visibility)
        self.windDeg    = Int64(reponse.windDeg)
        self.windSpeed  = reponse.windSpeed
    
    }
}
