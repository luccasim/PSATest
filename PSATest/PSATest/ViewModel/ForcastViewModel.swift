//
//  ForcastViewModel.swift
//  PSATest
//
//  Created by owee on 14/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import Foundation
import UIKit

final class ForcastViewModel {
    
    private let context = Context.shared
    
    var daysData    : [Day]
    var hourlyData  : [Hour]
    
    init() {
        self.daysData = self.context.selectedCity?.sortedDays ?? []
        self.hourlyData = self.context.selectedCity?.sortedHours ?? []
    }
    
    var day         : String {
        return "Today"
    }
    
    var tempMax     : String {
        return self.context.selectedCity?.tempMax.toInt ?? ""
    }
    
    var tempMin     : String {
        return self.context.selectedCity?.tempMin.toInt ?? ""
    }
    
    func getDay(Index:Int) -> String {
        return self.daysData[Index].dt.toDay
    }

    func getIcon(Index:Int) -> UIImage? {
        return UIImage(named: self.daysData[Index].icon ?? "01d")
    }
    
    func getTempMax(Index:Int) -> String {
        return self.daysData[Index].tempMax.toInt
    }
    
    func getTempMin(Index:Int) -> String {
        return self.daysData[Index].tempMin.toInt
    }
    
}

fileprivate extension Int64 {
    
    var toDay : String {
        let formater = DateFormatter()
        formater.dateFormat = "EEEE"
        let time = TimeInterval(self)
        let date = Date(timeIntervalSince1970: time)
        return formater.string(from: date)
    }
}
