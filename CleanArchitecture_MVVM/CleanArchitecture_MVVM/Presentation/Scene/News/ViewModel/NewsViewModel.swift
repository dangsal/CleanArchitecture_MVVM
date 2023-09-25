//
//  NewsViewModel.swift
//  CleanArchitecture_MVVM
//
//  Created by 이성호 on 2023/09/25.
//

import Foundation

import Combine

final class NewsViewModel {
    
    // MARK: - property
    
    private let newsService: NewsService
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - init
    
    init(newsService: NewsService) {
        self.newsService = newsService
        self.requestArticle(country: "us")
    }
    
    // MARK: - func
    
    // MARK: - network
    
    private func requestArticle(country: String) {
        Task {
            do {
                let articles = try await self.newsService.fetchNewsArticle(country: country)
            } catch(let error) {
                
            }
        }
    }
}
