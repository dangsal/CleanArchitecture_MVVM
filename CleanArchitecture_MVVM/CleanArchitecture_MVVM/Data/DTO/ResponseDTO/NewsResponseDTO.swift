//
//  NewsResponseDTO.swift
//  CleanArchitecture_MVVM
//
//  Created by 이성호 on 2023/09/25.
//

import Foundation

struct NewsResponseDTO: Decodable {
    let articles: [ArticleDTO]?
}

struct ArticleDTO: Decodable {
    let title: String?
    let description: String?
}

extension NewsResponseDTO {
    func toNewsResponse() -> NewsResponse {
        let transformedArticles: [Article]
        if let articleDTOs = articles {
            transformedArticles = articleDTOs.flatMap { $0.toArticles() }
        } else {
            transformedArticles = []
        }
        return NewsResponse(articles: transformedArticles)
    }

}

extension ArticleDTO {
    func toArticles() -> [Article] {
        let title = self.title ?? ""
        let description = self.description ?? ""
        return [Article(title: title,
                        description: description)]
    }
}
