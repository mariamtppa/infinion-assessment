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
    
    private let apiKey = Bundle.main.apiKey
    
    init() {}
    
    private func getWeatherUrl(city: String) -> URL? {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)") else { return nil }
        return url
    }
    
    func getCityWeatherInformation(from city: String, completion: @escaping (Result<WeatherDataResponse, Error>) -> Void) {
        guard let url = getWeatherUrl(city: city) else {
            debugPrint("unable to make url from city string ???")
            completion(.failure(AppError.defaultError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { weatherData, _, error in
            if let error {
                debugPrint("there is an error from the api ???")
                completion(.failure(AppError.endpointError(message: error.localizedDescription)))
                return
            }
            
            guard let weatherData else {
                debugPrint("no response ????????")
                completion(.failure(AppError.emptyResponse))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(WeatherDataResponse.self, from: weatherData)
                completion(.success(decodedData))
            } catch {
                debugPrint("unable to decode response ???")
                completion(.failure(AppError.decodingError))
            }
        }
        task.resume()
    }
}
