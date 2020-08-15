//
//  Day.swift
//  PSATest
//
//  Created by owee on 15/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import Foundation
import CoreData
import OpenWeatherFramework

class Day : NSManagedObject {
    
    func set(OneCallReponse reponse:OpenWeatherWS.OneCallReponse.Daily) {
        
        self.dt         = Int64(reponse.dt)
        self.tempMax    = reponse.temp.max
        self.tempMin    = reponse.temp.min
        self.tempDay    = reponse.temp.day
        self.sunrise    = Int64(reponse.sunrise)
        self.sunset     = Int64(reponse.sunset)
        
    }
}
