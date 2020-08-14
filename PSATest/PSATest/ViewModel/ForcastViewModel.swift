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
    
    private var selectedCity : String {
        return context.selectedCity ?? ""
    }
    
    var day         : String {
        return self.selectedCity
    }
    
    var tempMax     : String {
        return "XX"
    }
    
    var tempMin     : String {
        return "XX"
    }
    
    var hourlyData  : [Int] {
        return [1,1,1,1]
    }
    
    func getDay(Index:Int) -> String {
        return self.day + " 1"
    }

    func getIcon(Index:Int) -> UIImage? {
        return UIImage(named: "01n")
    }
    
    func getTempMax(Index:Int) -> String {
        return "20"
    }
    
    func getTempMin(Index:Int) -> String {
        return "10"
    }
    
}
