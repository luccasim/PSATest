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
    
}

//extension City : OWAPIWeather {
//
//
//
//    var cityNameRequest: String {
//        return self.name ?? ""
//    }
//
//    var coordLon: Double {
//        get {
//            self.lon
//        }
//        set(newValue) {
//            self.lon = newValue
//        }
//    }
//
//    var coorLat: Double {
//        get {
//            self.lat
//        }
//        set(newValue) {
//            self.lat = newValue
//        }
//    }
//
//    var weatherId: Int {
//        get {
//            Int(self.id)
//        }
//        set(newValue) {
//            self.id = Int64(newValue)
//        }
//    }
//
//    var weatherMain: String {
//        get {
//            self.main ?? ""
//        }
//        set(newValue) {
//            self.main = newValue
//        }
//    }
//
//    var weatherDesc: String {
//        get {
//            self.desc ?? ""
//        }
//        set(newValue) {
//            self.desc = newValue
//        }
//    }
//
//    var weatherIcon: String {
//        get {
//            self.icon ?? ""
//        }
//        set(newValue) {
//            self.icon = newValue
//        }
//    }
//
//    var mainTemp: Double {
//        get {
//            self.temperature
//        }
//        set(newValue) {
//            self.temperature = newValue
//        }
//    }
//
//    var mainFeelslike: Double {
//        get {
//            self.feelslike
//        }
//        set(newValue) {
//            self.feelslike = newValue
//        }
//    }
//
//    var mainPressure: Int {
//        get {
//            Int(self.pressure)
//        }
//        set(newValue) {
//            self.pressure = Int64(newValue)
//        }
//    }
//
//    var mainHumidity: Int {
//        get {
//            Int(self.humidity)
//        }
//        set(newValue) {
//            self.humidity = Int64(newValue)
//        }
//    }
//
//    var mainTempMin: Double {
//        get {
//            self.tempMin
//        }
//        set(newValue) {
//            self.tempMin = newValue
//        }
//    }
//
//    var mainTempMax: Double {
//        get {
//            self.tempMax
//        }
//        set(newValue) {
//            self.tempMax = newValue
//        }
//    }
//
//    var windDeg: Int {
//        get {
//            Int(self.windDegree)
//        }
//        set(newValue) {
//            self.windDegree = Int64(newValue)
//        }
//    }
//
//    var cloudsAll: Int {
//        get {
//            Int(self.clouds)
//        }
//        set(newValue) {
//            self.clouds = Double(newValue)
//        }
//    }
//
//    var sysCountry: String {
//        get {
//            self.country ?? ""
//        }
//        set(newValue) {
//            self.country = newValue
//        }
//    }
//
//    var sysSunrise: Int {
//        get {
//            Int(self.sunrise)
//        }
//        set(newValue) {
//            self.sunrise = Int64(newValue)
//        }
//    }
//
//    var sysSunset: Int {
//        get {
//            Int(self.sunset)
//        }
//        set(newValue) {
//            self.sunset = Int64(newValue)
//        }
//    }
//
//
//}
