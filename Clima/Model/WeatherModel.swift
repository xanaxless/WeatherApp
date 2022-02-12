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
    var daysOfWeek: [String] = []
    
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
    
    mutating func decleareDaysOfWeek() {
        var today = dayOfWeekNow()
        daysOfWeek.append("Now")
        for i in 1...7 {
            var cur = dayOfWeekByNum(day:(today+i))
            daysOfWeek.append(cur)
        }
    }
    
    func dayOfWeekNow() -> Int {
        var today = Date().dayOfWeek()
        switch today {
        case "Monday":
            return 1
        case "Tuesday":
            return 2
        case "Wednesday":
            return 3
        case "Thursday":
            return 4
        case "Friday":
            return 5
        case "Saturday":
            return 6
        case "Sunday":
            return 7
        default:
            return 1
        }
    }
    
    func dayOfWeekByNum(day: Int)->String{
        var d = day
        if(day>8){
            d=(day%8)+1
        }
        if(day==8){
            d=1
        }
        switch d{
        case 1:
            return "Mon"
        case 2:
            return "Tue"
        case 3:
            return "Wed"
        case 4:
            return "Thu"
        case 5:
            return "Fri"
        case 6:
            return "Sat"
        case 7:
            return "Sun"
        default:
            return "Mon"
        }
    }
}
    
