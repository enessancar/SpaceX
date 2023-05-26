//
//  APIURLs.swift
//  SpaceX
//
//  Created by Enes Sancar on 26.05.2023.
//

import Foundation

enum APIURLs {
    private static let baseURL = "https://api.spacexdata.com/v5/launches/"
    
    static let upcoming = "\(baseURL)upcoming"
    static let past = "\(baseURL)past"
    
    static func launchDetail(id: String) -> String {
        "\(baseURL)\(id)"
    }
}

enum LaunchType {
    case upcoming
    case past
}
