//
//  NewsViewModel.swift
//  CleanArchitecture_MVVM
//
//  Created by 이성호 on 2023/09/25.
//

import Foundation

import Combine

final class NewsViewModel {
    
    struct Input {
        let viewDidLoad: AnyPublisher<Void, Never>
    }
    
    struct Output {
        let articlePublisher: PassthroughSubject<[Article], NetworkError>
    }
    
    // MARK: - property
    
    private let articlePublisher = PassthroughSubject<[Article], NetworkError>()
    
    private let usecase: NewsUsecase
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - init
    
    init(usecase: NewsUsecase) {
        self.usecase = usecase
    }
    
    // MARK: - func
    
    func transform(input: Input) -> Output {
        input.viewDidLoad
            .sink { [weak self] in
                self?.requestArticle()
            }
            .store(in: &self.cancellable)
        
        return Output(articlePublisher: self.articlePublisher)
    }
    
    // MARK: - network
    
    private func requestArticle(country: String = "us") {
        Task {
            do {
                let articles = try await self.usecase.fetchNewsArticle(country: country)
                self.articlePublisher.send(articles.toNewsResponse().articles)
            } catch {
                self.articlePublisher.send(completion: .failure(.failedFetchArticles))
            }
        }
    }
}
