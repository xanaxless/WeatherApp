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
    
    var delegate: WeatherManagerDelegate? 
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
                    if let weather = self.parseJSON( safedata){
                        self.delegate?.didUpdateWeather(self, weather: weather);
                    }
                }
            }
            task.resume()
        }
    }
    func parseJSON(_ weatherData: Data)->WeatherModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionid: id, cityNane: name, temperature: temp)
            return weather
        } catch  {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
}
