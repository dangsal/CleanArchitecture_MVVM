//
//  NewsService.swift
//  CleanArchitecture_MVVM
//
//  Created by 이성호 on 2023/09/25.
//

import Foundation

protocol NewsServicicable {
    func fetchNewsArticle(country: String) async throws -> NewsResponseDTO
}

final class NewsService: NewsServicicable {
    
    private let repository: NewsRepository
    
    init(repository: NewsRepository) {
        self.repository = repository
    }
    
    func fetchNewsArticle(country: String) async throws -> NewsResponseDTO {
        do {
            let article = try await self.repository.fetchNewsArticle(country: country)
            return article
        } catch NetworkError.failedFetchArticles {
            throw NetworkError.failedFetchArticles
        } 
    }
}
