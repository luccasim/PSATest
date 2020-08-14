//
//  MetricsViewModel.swift
//  PSATest
//
//  Created by owee on 14/08/2020.
//  Copyright © 2020 Devios. All rights reserved.
//

import Foundation

final class MetricsViewModel {
    
    private let context = Context.shared
    
    var data : [(Title:String,Value:String)] = []
    
    init() {
        
        self.data.append((Title:"Lever", Value: "10"))
        self.data.append((Title:"Coucher", Value: "10"))
        self.data.append((Title:"Humidité", Value: "10"))
        self.data.append((Title:"Risque de pluie", Value: "10"))
        self.data.append((Title:"Vent", Value: "10"))
        self.data.append((Title:"Ressenti", Value: "10"))
        self.data.append((Title:"Précipitation", Value: "10"))
        self.data.append((Title:"Pression", Value: "10"))
        self.data.append((Title:"Visibilité", Value: "10"))
        self.data.append((Title:"Indice UV", Value: "10"))
        
    }
    
    func getTitle(Index:Int) -> String {
        return self.data[Index].Title
    }
    
    func getValue(Index:Int) -> String {
        return self.data[Index].Value
    }
    
    
}
