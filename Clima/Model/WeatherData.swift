//
//  WeatherData.swift
//  Clima
//
//  Created by Yerkebulan Serikov on 19.11.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable{
    let main: Main
    let name: String
    let weather: [Weather]
}
struct Main: Codable{
    let temp: Double 
}
struct Weather: Codable{
    let id: Int 
}
