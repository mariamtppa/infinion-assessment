//
//  BundleExtension.swift
//  infinion-assessment
//
//  Created by USER on 12/12/2025.
//

import Foundation

extension Bundle {
    
    var apiKey: String {
        return object(forInfoDictionaryKey: "OpenWeatherKeyId") as? String ?? ""
    }
}
