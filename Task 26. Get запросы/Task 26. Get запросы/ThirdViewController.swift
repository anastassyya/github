//
//  ThirdViewController.swift
//  Task 26. Get запросы
//
//  Created by Анастасия Вишневская on 1/25/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var latitudeTextField: UITextField!
    
    @IBOutlet weak var longitudeTextField: UITextField!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var latitudeLabel: UILabel!
    
    @IBOutlet weak var longitudeLabel: UILabel!
    
    @IBOutlet weak var weatherConditionLabel: UILabel!
    
    @IBOutlet weak var groupWeatherConditionsLabel: UILabel!
    
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var weatherIconLabel: UILabel!
    
    @IBOutlet weak var temperatureFeelLikeLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var temperatureMinimumLabel: UILabel!
    
    @IBOutlet weak var temperatureMaximumLabel: UILabel!
    
    
    @IBOutlet weak var windSpeed: UILabel!
    
    @IBOutlet weak var windDegLabel: UILabel!
    
    @IBOutlet weak var cloudinessLabel: UILabel!
    
    @IBOutlet weak var internalParameterTypeLabel: UILabel!
    
    @IBOutlet weak var internalParameterIdLabel: UILabel!
    
    @IBOutlet weak var countryCodeLabel: UILabel!
    
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    
    @IBOutlet weak var sunsetTimeLabel: UILabel!
    
    @IBOutlet weak var timezoneLabel: UILabel!
    
    @IBOutlet weak var cityIDLabel: UILabel!
    
    @IBOutlet weak var nameCityLabel: UILabel!
    
    @IBOutlet weak var codeLabel: UILabel!
    
    var latitudeTemp = "0"
    var longitudeTemp = "0"
    var cityTemp = ""
    
    var weatherArray : [WeatherStruct] = []
    var mainArray : [Main] = []
    var windArray : [Wind] = []
    var cloudsArray : [Clouds] = []
    var sysArray : [Sys] = []
    
    var coorItem = Coord()
    var weatherItem = Weather()
    var base: String?
    var mainItem = Main()
    var windItem = Wind()
    var cloudsItem = Clouds()
    var dt: Int?
    var sysItem = Sys()
    var timezone: Int?
    var id: Int?
    var name: String?
    var cod: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setParams(_ sender: UITextField) {
        latitudeTemp = latitudeTextField.text!
        longitudeTemp = longitudeTextField.text!
        cityTemp = cityTextField.text!
    }
    
    
    @IBAction func receiveDataButton(_ sender: UIButton) {
        getWeatherData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

    
    func setNameLabel () {
        if let latitudeTemp = coorItem.lat {
            latitudeLabel?.text = String(format: "%.1f", latitudeTemp)
        }
        else {
            latitudeLabel.text = ""
        }
        if let longitudeTemp = coorItem.lon {
            longitudeLabel?.text = String(format: "%.1f", longitudeTemp)
        }
        else {
            longitudeLabel.text = ""
        }
        if let weatherConditionTemp = weatherItem.id {
            weatherConditionLabel.text = String(weatherConditionTemp)
        } else {
            weatherConditionLabel.text = ""
        }
        if let groupWeatherConditionsTemp = weatherItem.main {
            groupWeatherConditionsLabel.text = String(format: "%.1f", groupWeatherConditionsTemp)
        } else {
            groupWeatherConditionsLabel.text = ""
        }
        if let weatherDescriptionTemp = weatherItem.description { weatherDescriptionLabel.text = weatherDescriptionTemp
        } else {
            weatherDescriptionLabel.text = ""
        }
        if let temperatureTemp = mainItem.temp {
            temperatureLabel.text = String(format: "%.1f", temperatureTemp)
        } else {
            temperatureLabel.text = ""
        }
        if let weatherIconTemp = weatherItem.icon {
            weatherIconLabel.text = weatherIconTemp
        }
        else {
            weatherIconLabel.text = ""
        }
        if let temperatureFeelLikeTemp = mainItem.feelsLike { temperatureFeelLikeLabel.text = String(format: "%.1f", temperatureFeelLikeTemp)
        } else {
            temperatureFeelLikeLabel.text = ""
        }
        if let pressureTemp = mainItem.pressure {
            pressureLabel.text = String(pressureTemp)
        } else {
            pressureLabel.text = ""
        }
        if let humidityTemp = mainItem.humidity {
            humidityLabel.text = String(humidityTemp)
        } else {
            humidityLabel.text = ""
        }
        if let temperatureMinimumTemp = mainItem.tempMin{
            temperatureMinimumLabel.text =  String(format: "%.1f", temperatureMinimumTemp)
        } else {
            temperatureMinimumLabel.text  = ""
        }
        if let temperatureMaximumTemp = mainItem.tempMax {
            temperatureMaximumLabel.text = String(format: "%.1f", temperatureMaximumTemp)
        } else {
            temperatureMaximumLabel.text = ""
        }
        if let windSpeedTemp = windItem.speed {
            windSpeed.text = String(format: "%.1f", windSpeedTemp)
        } else {
            windSpeed.text = ""
        }
        if let windDegTemp = windItem.deg {
            windDegLabel.text = String(windDegTemp)
        }
        else {
            windDegLabel.text = ""
        }
        if let cloudinessTemp = windItem.gust {
            cloudinessLabel.text = String(format: "%.1f", cloudinessTemp)
        }
        else {
            cloudinessLabel.text = ""
        }
        if let internalParameterTypeTemp = sysItem.type {
            internalParameterTypeLabel.text = String(internalParameterTypeTemp)
        }
        else {
            internalParameterTypeLabel.text = ""
        }
        if let internalParameterIdTemp = sysItem.id {
            internalParameterIdLabel.text = String(internalParameterIdTemp)
        }
        else {
            internalParameterIdLabel.text = ""
        }
        if let countryCodeTemp = sysItem.country {
            countryCodeLabel.text = countryCodeTemp
        }
        else {
            countryCodeLabel.text = ""
        }
        if let sunriseTimeTemp = sysItem.sunrise {
            sunriseTimeLabel.text = String(sunriseTimeTemp)
        }
        else {
            sunriseTimeLabel.text = ""
        }
        if let sunsetTimeTemp = sysItem.sunset {
            sunsetTimeLabel.text = String(sunsetTimeTemp)
        }
        else {
            sunsetTimeLabel.text = ""
        }
        if let timezoneTemp = timezone {
            timezoneLabel.text = String(timezoneTemp)
        }
        else {
            timezoneLabel.text = ""
        }
        if let cityIDTemp = id {
            cityIDLabel.text = String(cityIDTemp)
        }
        else {
            cityIDLabel.text = ""
        }
        if let nameCityTemp = name {
            nameCityLabel.text = nameCityTemp
        }
        else {
            nameCityLabel.text = ""
        }
        if let codeTemp = cod {
            codeLabel.text = String(codeTemp)
        }
        else {
            codeLabel.text = ""
        }
        
        
    }
        func getWeatherData() {
            
            var query: [String: String] = ["": ""]
            if latitudeTextField.text != "",  longitudeTextField.text != "" {
            query = [
                "lat": latitudeTextField.text!,
                "lon" : longitudeTextField.text!,
                "appid" : "767e4c3dd7080e41e5b574ccaee2bbb5"]
            } else if cityTextField.text != "" {
            query = [
                    "q": cityTextField.text!,
                    "appid" : "767e4c3dd7080e41e5b574ccaee2bbb5"]
            }
            setToNil()
            let baseURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139")!
            let url = baseURL.withQueries(query)!
            let session = URLSession.shared
            let request = URLRequest(url: url)
            print (url)
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                
                guard error == nil else {
                    print("ERROR!!!  error: \(String(describing: error))")
                    return
                }
                
                guard let data = data else {
                    print("ERROR!!!  data == nil")
                    return
                }
                
                do {
                    if let arrayOfJsonObjects = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]  {
                        
                        print("arrayOfJsonObjects: \(arrayOfJsonObjects)")
                        for _ in arrayOfJsonObjects {
                            print ("function")
                            print (type(of: arrayOfJsonObjects["weather"]) )
                            
                            if let coord = arrayOfJsonObjects["coord"] as? [String: Double]{
                                let lon: Double? = coord["lon"]
                                let lat: Double? = coord["lat"]
                                self.coorItem = Coord(lon: lon!, lat: lat!)
                            }
                            if let weather = arrayOfJsonObjects["weather"] as? [AnyObject] {
                                for i in weather {
                                    let id: Int? = i["id"] as? Int
                                    let main: String? = i["main"] as? String
                                    let description: String? = i["description"] as? String
                                    let icon: String? = i["icon"] as? String
                                    self.weatherItem = Weather(id: id, main: main, description: description, icon: icon)
                                }
                            }
                            if let baseTemp = arrayOfJsonObjects["base"] as? String {
                                self.base = baseTemp
                            }
                            if let main = arrayOfJsonObjects["main"] as? [String: Any]{
                                let temp: Double? = main["temp"] as? Double
                                let feelsLike: Double? = main["feels_like"] as? Double
                                let tempMin: Double? = main["temp_min"] as? Double
                                let tempMax: Double? = main["temp_max"] as? Double
                                let pressure: Int? = main["pressure"] as? Int
                                let humidity: Int? = main["humidity"] as? Int
                                self.mainItem = Main(temp: temp, feelsLike: feelsLike, tempMin: tempMin, tempMax: tempMax, pressure: pressure, humidity: humidity)
                            }
                            if let wind = arrayOfJsonObjects["wind"] as? [String: Any]{
                                let speed: Double? = wind["speed"] as? Double
                                let deg: Int? = wind["deg"] as? Int
                                let gust: Double? = wind["gust"] as? Double
                                self.windItem = Wind(speed: speed, deg: deg, gust: gust)
                            }
                            if let clouds = arrayOfJsonObjects["clouds"] as? [String: Any] {
                                let all: Int? = clouds["all"] as? Int
                                self.cloudsItem = Clouds(all: all)
                            }
                            if let dtTemp = arrayOfJsonObjects["dt"] as? Int {
                                self.dt = dtTemp
                            }
                            if let sys = arrayOfJsonObjects["sys"] as? [String: Any] {
                                let type: Int? = sys["type"] as? Int
                                let id: Int? = sys["id"] as? Int
                                let country: String? = sys["country"] as? String
                                let sunrise: Int? = sys["sunrise"] as? Int
                                let sunset: Int? = sys["sunset"] as? Int
                                self.sysItem = Sys(type: type, id: id, country: country, sunrise: sunrise, sunset: sunset)
                            }
                            if let timezoneTemp = arrayOfJsonObjects["timezone"] as? Int {
                                self.timezone = timezoneTemp
                            }
                            if let idTemp = arrayOfJsonObjects["id"] as? Int {
                                self.id = idTemp
                            }
                            if let nameTemp = arrayOfJsonObjects["name"] as? String {
                                self.name = nameTemp
                            }
                            if let codTemp = arrayOfJsonObjects["cod"] as? Int {
                                self.cod = codTemp
                            }
                            
                        }
                        self.weatherArray = [WeatherStruct(coord: self.coorItem, weather: self.weatherItem, base: self.base, main: self.mainItem, wind: self.windItem, clouds: self.cloudsItem, dt: self.dt, sys: self.sysItem, timezone: self.timezone, id: self.id, name: self.name, cod: self.cod)]
                        print (self.weatherArray)
                        DispatchQueue.main.async {
                            self.setNameLabel()
                        }
                    }
                    else
                    {
                        print("json == nil")
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            })
            task.resume()
        }
    
    func setToNil () {
    latitudeTextField.text = ""
    longitudeTextField.text = ""
    cityTextField.text = ""
    longitudeLabel.text = ""
    weatherConditionLabel.text = ""
    groupWeatherConditionsLabel.text = ""
    weatherDescriptionLabel.text = ""
    temperatureLabel.text = ""
    weatherIconLabel.text = ""
    temperatureFeelLikeLabel.text = ""
    pressureLabel.text = ""
    humidityLabel.text = ""
    temperatureMinimumLabel.text = ""
    temperatureMaximumLabel.text = ""
    windSpeed.text = ""
    windDegLabel.text = ""
    cloudinessLabel.text = ""
    internalParameterTypeLabel.text = ""
    internalParameterIdLabel.text = ""
    countryCodeLabel.text = ""
    sunriseTimeLabel.text = ""
    sunsetTimeLabel.text = ""
    timezoneLabel.text = ""
    cityIDLabel.text = ""
    nameCityLabel.text = ""
    codeLabel.text = ""
    }
}
