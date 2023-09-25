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
