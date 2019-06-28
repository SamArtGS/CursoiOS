//
//  ViewController.swift
//  AplicacionClima
//
//  Created by Rodrigo Vivas on 6/27/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestLocation()
    }
    
    func manejoJSON(data: [String: Any]){
        if let name = data["name"] as? String{
            cityNameLabel.text = "\(name)"
        }
        if let wind = data["wind"] as? [String:Any]{
            if let windSpeed = wind["speed"] as? Double{
                windSpeedLabel.text = "\(windSpeed) m/s"
            }
        }
        
        if let main = data["main"] as? [String:Any]{
            if let humidity = main["humidity"] as? Int{
                humidityLabel.text = "\(humidity)"
            }
            
            if let temp = main["temp"] as? Double{
                var tempC = temp - 273.15
                tempC = round(tempC)
                temperatureLabel.text = "\(tempC) ºC"
            }
        }
        
    }
    
    func getWeather(lat: String, lon: String){
        let apiKey = APIClient.shared.apiKey
        
        if var urlComponents = URLComponents(string: APIClient.shared.baseURL){
            urlComponents.query = "lat=\(lat)&lon=\(lon)&APPID=\(apiKey)"
            
            guard let url = urlComponents.url else {return}
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            
            let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error{
                    print(error.localizedDescription)
                    return
                }
                guard let data = data else {return}
                
                do{
                    guard let weatherData = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else{
                        print("Error al convertir datos")
                        return
                    }
                    print(weatherData)
                    
                    DispatchQueue.main.async {
                        self.manejoJSON(data: weatherData)
                    }
                }
                catch{
                    print("Error al convertir a JSON")
                }
            }
            task.resume()
            
        }
    }


}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            print(latitude)
            print(longitude)
            getWeather(lat: latitude, lon: longitude)
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status{
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        case .denied, .restricted:
            let alertController = UIAlertController(title: "Acceso a localización desactivado. Cambia en configuración.", message: "Aplicación clima necesita tu ubicación", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { (action) in
                alertController.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(cancelAction)
            
            //Me permite abrir la app de Configuración del teléfono
            let openAction = UIAlertAction(title: "Abrir", style: .default) { (action) in
                if let url = URL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
            alertController.addAction(openAction)
            present(alertController, animated: true, completion: nil)
            
            break
        }
    }
}

