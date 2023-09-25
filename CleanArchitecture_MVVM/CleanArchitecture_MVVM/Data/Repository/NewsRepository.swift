//
//  NewsRepository.swift
//  CleanArchitecture_MVVM
//
//  Created by 이성호 on 2023/09/25.
//

import Foundation

import Moya

protocol NewsRepository {
    func fetchNewsArticle(country: String) async throws -> NewsResponseDTO
}

final class NewsRepositoryImpl: NewsRepository {
    
    private var provider = MoyaProvider<NewsEndPoint>()

    func fetchNewsArticle(country: String) async throws -> NewsResponseDTO {
        return try await withCheckedThrowingContinuation { continuation in
            self.provider.request(.fetchArticle(country: country)) { result in
                switch result {
                case .success(let response):
                    do {
                        let articles = try response.map(NewsResponseDTO.self)
                        continuation.resume(returning: articles)
                    } catch {
                        continuation.resume(throwing: NetworkError.failedFetchArticles)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

enum NetworkError: Error {
    case failedFetchArticles
}
