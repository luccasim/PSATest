//
//  ListCityViewModel.swift
//  PSATest
//
//  Created by owee on 14/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import Foundation

class ListCityViewModel {
    
    private var context : Context {
        return Context.shared
    }
    
    var data : [City] {
        return context.cityList
    }
    
    func unselectCity() {
        self.context.selectedCity = nil
    }
    
    func selectCity(Index:Int) {
        self.context.selectedCity = self.data[Index]
    }
    
    func removeCity(Index:Int) {
        self.context.cityList.remove(at: Index)
    }
    
}
