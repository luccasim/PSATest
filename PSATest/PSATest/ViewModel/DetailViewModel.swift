//
//  DetailViewModel.swift
//  PSATest
//
//  Created by owee on 14/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import Foundation

class DetailViewModel {
    
    private var context = Context.shared
    
    var main : String {
        return context.selectedCity?.main ?? ""
    }
    
    var description : String {
        return context.selectedCity?.desc ?? ""
    }
    
    var temp : String {
        return context.selectedCity?.temperature.toIntDegree ?? ""
    }
    
}
