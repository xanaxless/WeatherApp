//
//  WeatherManager .swift
//  Clima
//
//  Created by Yerkebulan Serikov on 18.11.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel);
    func didFailWithError(error: Error)
}

class WeatherManager {
    
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=f7a0e2f9d6b594db0840192cc075f9a5&units=metric"
    
    var weather8DaysManager =  WeatherForWeekManager()
    var delegate: WeatherManagerDelegate?
    var weather8daysData : WeatherForWeekData?
    var id: Int = 0
    var temp : Double = 0
    var name = ""
    init() {
        weather8DaysManager.delegate = self
    }
    
    
    
    func fetchWeather(cityname: String){
        let urlString = "\(weatherURL)&q=\(cityname)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: Double , longitude: Double){
        let urlString = "\(weatherURL)&lon=\(longitude)&lat=\(latitude)"
        performRequest(with: urlString)
    }
    func performRequest(with urlString: String){
        if let url = URL(string: urlString){
            let seccion = URLSession(configuration: .default)
            let task = seccion.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safedata = data{
                    let dataString = String(data: safedata, encoding: .utf8)
                    self.parseJSON( safedata)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let lat = decodedData.coord.lat
            let lon = decodedData.coord.lon
            weather8DaysManager.fetchWeather(latitude: lat, longitude: lon)
            id = decodedData.weather[0].id
            temp = decodedData.main.temp
            name = decodedData.name
            return
        } catch  {
            self.delegate?.didFailWithError(error: error)
            return
        }
        
    }
    
}


//MARK: - WeatherForWeekDelegate

extension WeatherManager : WeatherForWeekDelegate{
    func didUpdateWeather(_ weatherManager: WeatherForWeekManager, weather8Days: WeatherForWeekData) {
        weather8daysData = weather8Days
        let weather = WeatherModel(conditionid: id, cityNane: name, temperature: temp, days: weather8daysData!.daily )
        self.delegate?.didUpdateWeather(self, weather: weather);
    }
    
    func didFailWithError(error: Error) {
        delegate?.didFailWithError(error: error)
    }
    
    
}
