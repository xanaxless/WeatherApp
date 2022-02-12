//
//  WeatherModel.swift
//  Clima
//
//  Created by Yerkebulan Serikov on 20.11.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
struct WeatherModel{
    let conditionid:Int
    let cityNane:String
    let temperature : Double
    let days: [Daily]
    
    var temperatureString: String{
        var answ: String = String(round(temperature*10)/10)
        return answ;
    }
    
    var conditionName : String{
        switch conditionid {
        case 200...232:
            return  "cloud.bolt"
        case 300...321:
            return  "cloud.drizzle"
        case 500...504:
            return  "cloud.sun.rain"
        case 511:
            return "snowflake"
        case 520...531:
            return  "cloud.rain"
        case 600...622:
            return  "cloud.snow"
        case 701...781:
            return  "tornado"
        case 800:
            return  "sun.max"
        case 801...804:
            return  "cloud"
        default:
            return "cloud"
        }
    }
    
    func conditionNameDay(id: Int) -> String{
        switch id {
        case 200...232:
            return  "cloud.bolt"
        case 300...321:
            return  "cloud.drizzle"
        case 500...504:
            return  "cloud.sun.rain"
        case 511:
            return "snowflake"
        case 520...531:
            return  "cloud.rain"
        case 600...622:
            return  "cloud.snow"
        case 701...781:
            return  "tornado"
        case 800:
            return  "sun.max"
        case 801...804:
            return  "cloud"
        default:
            return "cloud"
        }
    }
    
}
    
