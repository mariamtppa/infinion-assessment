//
//  HomeViewModel.swift
//  infinion-assessment
//
//  Created by USER on 12/12/2025.
//

import Foundation

final class HomeViewModel: NSObject {
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .shared) {
        self.userDefaults = userDefaults
    }
    
    func getFavouriteCity() -> String {
        return userDefaults.favouriteCity ?? ""
    }
    
    func saveFavouriteCity(city: String) {
        userDefaults.favouriteCity = city
    }
}
