//
//  Context.swift
//  PSATest
//
//  Created by owee on 14/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import Foundation

final class Context {
    
    private init() {
        self.cityList = City.fetchCities()
    }
    
    static let shared = Context()
        
    var cityList : [City]
    
    var selectedCity : City? {
        didSet {
            print("\(self.selectedCity?.name ?? "<None>") selected")
        }
    }
}
