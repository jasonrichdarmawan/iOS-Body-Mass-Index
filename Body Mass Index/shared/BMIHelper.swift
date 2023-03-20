//
//  BMIHelper.swift
//  Body Mass Index
//
//  Created by Jason Rich Darmawan Onggo Putra on 20/03/23.
//

import SwiftUI

struct BMIHelper {
    private init() {}
    
    // kg/m2
    static func calculateBMI(weight: Double, height: Double) -> Double {
        return weight / ( height / 100 * height / 100 )
    }

    static func bmiScale(result: Double) -> (scale: String, color: Color){
        switch result {
        case 0..<18.4:
            return ("Underweight", .blue)
        case 18.5..<24.9:
            return ("Normal", .green)
        case 25..<39.9:
            return ("Overweight", .orange)
        default:
            return ("Obese", .red)
        }
    }

    static func bmiScale(weight: Double, height: Double) -> (scale: String, color: Color) {
        return bmiScale(result: calculateBMI(weight: weight, height: height))
    }
}
