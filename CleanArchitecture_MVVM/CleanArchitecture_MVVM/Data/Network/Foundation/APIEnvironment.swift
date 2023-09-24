//
//  APIEnvironment.swift
//  CleanArchitecture_MVVM
//
//  Created by 이성호 on 2023/09/24.
//

import Foundation

enum APIEnvironment {
    static let baseURL: URL = URL(string: Bundle.main.developmentURL)!
    static let apiKey: String = Bundle.main.apiKey
}
