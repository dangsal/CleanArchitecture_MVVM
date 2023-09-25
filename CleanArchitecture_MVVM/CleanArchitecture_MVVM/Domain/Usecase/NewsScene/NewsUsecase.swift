//
//  NewsUsecase.swift
//  CleanArchitecture_MVVM
//
//  Created by 이성호 on 2023/09/25.
//

import Foundation

protocol NewsUsecase {
    func fetchNewsArticle(country: String) async throws -> NewsResponseDTO
}

final class NewsUsecaseImpl: NewsUsecase {
    
    // MARK: - property
    
    private let repository: NewsRepository
    
    // MARK: - init
    
    init(repository: NewsRepository) {
        self.repository = repository
    }
    
    // MARK: - public - func
    
    func fetchNewsArticle(country: String) async throws -> NewsResponseDTO {
        do {
            let article = try await self.repository.fetchNewsArticle(country: country)
            return article
        } catch NetworkError.failedFetchArticles {
            throw NetworkError.failedFetchArticles
        }
    }
}
