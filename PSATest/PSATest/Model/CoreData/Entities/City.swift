//
//  City.swift
//  PSATest
//
//  Created by owee on 15/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import Foundation
import CoreData
import UIKit
import OpenWeatherFramework

class City : NSManagedObject {
    
    static func fetch(Name:String) -> City {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request : NSFetchRequest<City> = City.fetchRequest()
        request.predicate = NSPredicate(format: "name = %@", Name)
        
        do {
            let results = try context.fetch(request)
            
            if let first = results.first {
                return first
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        return City(context: context)
    }
    
    static func fetchCities() -> [City] {
        
        let request : NSFetchRequest<City> = City.fetchRequest()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            
            let results = try context.fetch(request)
            return results
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        return []
    }
    
    func update(Reponse:OpenWeatherWS.WeatherReponse) {
        
        self.dt = Int64(Reponse.dt)
        
        self.lon = Reponse.coord.lon
        self.lat = Reponse.coord.lat
        self.main = Reponse.weathers[0].main
        self.desc = Reponse.weathers[0].description
        self.icon = Reponse.weathers[0].icon
        self.temperature = Reponse.main.temp
        self.tempMin = Reponse.main.tempMin
        self.tempMax = Reponse.main.tempMax
        self.pressure = Int64(Reponse.main.pressure)
        self.humidity = Int64(Reponse.main.humidity)
        self.visibility = Double(Reponse.visibility)
        self.clouds = Double(Reponse.clouds.all)
        self.windSpeed = Reponse.wind.speed
        self.windDegree = Int64(Reponse.wind.deg)
        self.timezone = Int64(Reponse.timezone)
        self.id = Int64(Reponse.id)
        self.name = Reponse.name
        self.sunset = Int64(Reponse.sys.sunset)
        self.sunrise = Int64(Reponse.sys.sunrise)
        self.country = Reponse.sys.country
    }
    
    func update(OneCallReponse reponse:OpenWeatherWS.OneCallReponse) {
        
        guard let context = self.managedObjectContext else {return}
        
        reponse.hourly.forEach { (hourly) in
            let hour = Hour(context: context)
            hour.set(OneCallReponse: hourly)
            self.addToHours(hour)
        }
        
        reponse.daily.forEach { (daily) in
            let day = Day(context: context)
            day.set(OneCallReponse: daily)
            self.addToDays(day)
        }
        
        self.uvi = reponse.current.uvi
    }
}

extension Double {
    
    var toInt : String {
        return Int(self).description
    }
    
    var toIntDegree : String {
        return Int(self).description + "°"
    }
}

extension City {
    
    var sortedHours : [Hour] {
        let hours = self.hours?.allObjects as? [Hour] ?? []
        return hours.sorted(by: {$0.dt < $1.dt})
    }
    
    var sortedDays : [Day] {
        let days = self.days?.allObjects as? [Day] ?? []
        return days.sorted(by: {$0.dt < $1.dt})
    }
}
