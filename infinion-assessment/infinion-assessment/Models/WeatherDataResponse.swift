//
//  WeatherDataResponse.swift
//  infinion-assessment
//
//  Created by USER on 11/12/2025.
//

import Foundation

struct WeatherDataResponse: Codable {
    let coord: Coord?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let timezone: Int?
    let id: Int?
    let name: String?
    let cod: Int?

    enum CodingKeys: String, CodingKey {
        case coord = "coord"
        case weather = "weather"
        case base = "base"
        case main = "main"
        case visibility = "visibility"
        case wind = "wind"
        case clouds = "clouds"
        case dt = "dt"
        case sys = "sys"
        case timezone = "timezone"
        case id = "id"
        case name = "name"
        case cod = "cod"
    }
}

struct Coord : Codable {
    let lon: Double?
    let lat: Double?
    
    enum CodingKeys: String, CodingKey {
        case lon, lat
    }
}

struct Weather : Codable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
}

struct Main : Codable {
    let temp: Double?
    let feelsLike: Double?
    let tempMin: Double?
    let tempMax: Double?
    let pressure: Int?
    let humidity: Int?
    let seaLevel: Int?
    let grndLevel: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

struct Wind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
    
    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
        case gust = "gust"
    }
}

struct Clouds: Codable {
    let all: Int?
    
    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
}

struct Sys: Codable {
    let country: String?
    let sunrise: Int?
    let sunset: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
}

struct ErrorResponse: Error, Codable {
    let cod: Int?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case cod
        case message
    }
}
