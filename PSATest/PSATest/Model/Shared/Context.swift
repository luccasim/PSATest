//
//  Context.swift
//  PSATest
//
//  Created by owee on 14/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import Foundation

final class Context {
    
    private init(){}
    
    static let shared = Context()
    
    var cityList : [String] = ["Paris", "London", "Madrid", "Rome", "Berlin"]
    
    var selectedCity : String? {
        didSet {
            print("\(self.selectedCity ?? "<None>") selected")
        }
    }
    
}
