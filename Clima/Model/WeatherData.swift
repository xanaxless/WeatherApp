//
//  WeatherData.swift
//  Clima
//
//  Created by Yerkebulan Serikov on 19.11.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable{
    let coord: Coord
    let main: Main
    let name: String
    let weather: [Weather]
}
struct Coord: Codable{
    let lon: Double
    let lat: Double
}

struct Main: Codable{
    let temp: Double 
}
struct Weather: Codable{
    let id: Int 
}

