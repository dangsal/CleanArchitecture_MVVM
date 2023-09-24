//
//  NewsEndPoint.swift
//  CleanArchitecture_MVVM
//
//  Created by 이성호 on 2023/09/24.
//

import Foundation

import Moya

enum NewsEndPoint {
    case fetchArticle(country: String)
}

extension NewsEndPoint: TargetType {
    var baseURL: URL {
        return APIEnvironment.baseURL
    }
    
    var path: String {
        switch self {
        case .fetchArticle:
            return "/top-headlines"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchArticle:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchArticle(let country):
            return .requestParameters(parameters: ["country" : country, "apiKey" : APIEnvironment.apiKey], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
