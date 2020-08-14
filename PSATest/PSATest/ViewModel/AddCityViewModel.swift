//
//  AddCityViewModel.swift
//  PSATest
//
//  Created by owee on 14/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import Foundation

final class AddCityViewModel {
    
    private var context = Context.shared
    
    var data : [String] = []
    
    func search(CityName:String, Result: @escaping ((Bool)->())) {
        
        //Here call Webservice
        self.data.append(CityName)
        Result(true)
        
    }
    
    func add(Index:Int) {
        self.context.cityList.append(self.data[Index])
    }
}
