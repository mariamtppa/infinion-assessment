//
//  UserDefaultsExtension.swift
//  infinion-assessment
//
//  Created by USER on 12/12/2025.
//

import Foundation

extension UserDefaults {
    static let shared = UserDefaults()
    
    enum UserDefaultKeys: String, CaseIterable {
        case favouriteCity
    }
    
    var favouriteCity: String? {
        get {
            object(forKey: UserDefaultKeys.favouriteCity.rawValue) as? String
        }
        
        set {
            set(newValue, forKey: UserDefaultKeys.favouriteCity.rawValue)
        }
    }
}
