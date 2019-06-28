//
//  APIClient.swift
//  AplicacionClima
//
//  Created by Rodrigo Vivas on 6/27/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import Foundation

class APIClient{
    static let shared: APIClient = APIClient()
    
    let baseURL: String = "https://api.openweathermap.org/data/2.5/weather"
    
    let apiKey = "7cfbcfc77b37509dd81a3eb1563d76fb"
    
    func getWeatherDataURL(lat: String, lon: String) -> String{
        return "\(baseURL)?lat=\(lat)&lon=\(lon)&APPID=\(apiKey)"
    }
}
