//
//  Article.swift
//  CleanArchitecture_MVVM
//
//  Created by 이성호 on 2023/09/25.
//

import Foundation

struct NewsResponse {
    let articles: [Article]
}

struct Article {
    let title: String
    let description: String
}

extension Article: Equatable {
    static let testArticle = [Article(title: "테스트 타이틀",
                                     description: "테스트 디스크립션")]
}
