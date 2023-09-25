//
//  NewsResponseDTO.swift
//  CleanArchitecture_MVVM
//
//  Created by 이성호 on 2023/09/25.
//

import Foundation

struct NewsResponseDTO: Decodable {
    let articles: [Article]
}
