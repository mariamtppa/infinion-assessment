//
//  DetailsViewModel.swift
//  infinion-assessment
//
//  Created by USER on 11/12/2025.
//

import Foundation

protocol DetailsViewModelDelegate: AnyObject {
    func updateUI(weatherData: WeatherDataResponse)
    func showError(errorMessage: String)
}

final class DetailsViewModel: NSObject {
    private let city: String
    private let apiClient: WeatherDataApiInterface
    weak var detailsViewModelDelegate: DetailsViewModelDelegate?
    
    init(city: String,
        apiClient: WeatherDataApiInterface = WeatherDataApiLoader()) {
        self.city = city
        self.apiClient = apiClient
    }
    
    func getWeatherData() {
        apiClient.getCityWeatherInformation(from: city, completion:  { [weak self] response in
            guard let self else { return }
            switch response {
            case .success(let responseData):
                detailsViewModelDelegate?.updateUI(weatherData: responseData)
            case .failure(let error):
                detailsViewModelDelegate?.showError(errorMessage: error.localizedDescription)
            }
        })
    }
}
