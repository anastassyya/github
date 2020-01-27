//
//  Structs.swift
//  Task 26. Get запросы
//
//  Created by Анастасия Вишневская on 1/21/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import Foundation

struct CurrencyStruct {
    var currency : String?
    var ourCurrency : String?
    var buy: String?
    var sale: String?
    init (currency : String? = nil, ourCurrency : String? = nil, buy: String? = nil, sale: String? = nil) {
        self.currency = currency
        self.ourCurrency = ourCurrency
        self.buy = buy
        self.sale = sale
    }
}

struct CurrencyStructArchive {
    var baseCurrency : String?
    var currency : String?
    var saleRateNB : Double?
    var purchaseRateNB : Double?
    var saleRate : Double?
    var purchaseRate : Double?
    init (baseCurrency : String? = nil, currency : String? = nil, saleRateNB : Double? = nil, saleRate : Double? = nil, purchaseRateNB : Double? = nil, purchaseRate : Double? = nil) {
        self.baseCurrency = baseCurrency
        self.currency = currency
        self.saleRateNB = saleRateNB
        self.purchaseRateNB = purchaseRateNB
        self.saleRate = saleRate
        self.purchaseRate = purchaseRate
    }
    
}

struct WeatherStruct {
    var coord: Coord?
    var weather: Weather?
    var base: String?
    var main: Main
    var wind: Wind
    var clouds: Clouds
    var dt: Int?
    var sys: Sys
    var timezone: Int?
    var id: Int?
    var name: String?
    var cod: Int?
    
    init (coord: Coord? = nil, weather: Weather? = nil, base: String? = nil, main: Main, wind: Wind, clouds: Clouds, dt: Int? = nil, sys: Sys, timezone: Int? = nil, id: Int? = nil, name: String? = nil, cod: Int? = nil){
        self.coord = coord
        self.weather = weather
        self.base = base
        self.main = main
        self.wind = wind
        self.clouds = clouds
        self.dt = dt
        self.sys = sys
        self.timezone = timezone
        self.id = id
        self.name = name
        self.cod = cod
    }
}

struct Coord {
    var lon: Double?
    var lat: Double?
    init (lon: Double? = nil, lat: Double? = nil) {
        self.lon = lon
        self.lat = lat
    }
        
}

struct Weather {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
    init (id: Int? = nil, main: String? = nil, description: String? = nil, icon: String? = nil) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
    
}

struct Main {
    var temp: Double?
    var feelsLike: Double?
    var tempMin: Double?
    var tempMax: Double?
    var pressure: Int?
    var humidity: Int?
    init (temp: Double? = nil, feelsLike: Double? = nil, tempMin : Double? = nil, tempMax: Double? = nil, pressure: Int? = nil, humidity: Int? = nil) {
        self.temp = temp
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.humidity = humidity
    }
    
}
struct Wind {
    var speed: Double?
    var deg: Int?
    var gust: Double?
    init (speed: Double? = nil, deg: Int? = nil, gust: Double? = nil) {
        self.speed = speed
        self.deg = deg
        self.gust = gust
    }
}

struct Clouds {
    var all: Int?
    init (all: Int? = nil) {
        self.all = all
    }
}

struct Sys {
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Int?
    var sunset: Int?
    init (type: Int? = nil, id: Int? = nil, country: String? = nil, sunrise: Int? = nil, sunset: Int? = nil) {
        self.type = type
        self.id = id
        self.country = country
        self.sunrise = sunrise
        self.sunset = sunset
    }
}


