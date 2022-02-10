//
//  WeatherData8Days.swift
//  Clima
//
//  Created by Yerkebulan Serikov on 10.02.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
struct WeatherForWeekData:Codable {
    let daily: [Daily]
}
struct Daily:Codable {
    let temp: Temp
    let weather: [Weather]
}
struct Temp:Codable {
    let day: Double
    let night: Double
}

