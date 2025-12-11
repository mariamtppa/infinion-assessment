//
//  WeatherDataLoader.swift
//  infinion-assessment
//
//  Created by USER on 11/12/2025.
//

import Foundation

protocol WeatherDataApiInterface {
    func getCityWeatherInformation(from city: String, completion: @escaping (Result<WeatherDataResponse, Error>) -> Void)
}

final class WeatherDataApiLoader: WeatherDataApiInterface {
    
    private let apiKey = "73d46ec792f7188ca13af020d5a05ecf"
    
    init() {}
    
    private func getWeatherUrl(city: String) -> URL? {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)") else { return nil }
        return url
    }
    
    func getCityWeatherInformation(from city: String, completion: @escaping (Result<WeatherDataResponse, Error>) -> Void) {
        guard let url = getWeatherUrl(city: city) else {
            completion(.failure(AppError.decodingError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { weatherData, _, error in
            if let error {
                completion(.failure(AppError.endpointError(message: error.localizedDescription)))
                return
            }
            
            guard let weatherData else {
                completion(.failure(AppError.emptyResponse))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(WeatherDataResponse.self, from: weatherData)
                completion(.success(decodedData))
            } catch {
                completion(.failure(AppError.decodingError))
            }
        }
        task.resume()
    }
}
