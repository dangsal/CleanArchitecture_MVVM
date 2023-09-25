//
//  NewsResponseTest.swift
//  CleanArchitecture_MVVMTests
//
//  Created by 이성호 on 2023/09/25.
//

import Foundation
import XCTest
@testable import CleanArchitecture_MVVM

final class NewsResponseTest: XCTestCase {
    func test_article_변수가_있는가() {
        //given
        let sut = Article.testArticle
        
        let _ = sut[0].title
        let _ = sut[0].description
    }
    
    func test_article_변수가_올바른_값을_리턴하는가() {
        // given
        let sut = Article.testArticle
        
        // when
        let title = sut[0].title
        let description = sut[0].description
        
        // then
        XCTAssertEqual(title, "테스트 타이틀")
        XCTAssertEqual(description, "테스트 디스크립션")
    }
    
    func test_article_변수에_틀린값이_들어왔을때_실패하는가() {
        // given
        let sut = Article.testArticle
        
        // when
        let title = sut[0].title
        let description = sut[0].description
        
        // then
        XCTAssertNotEqual(title, "테스트타이틀")
        XCTAssertNotEqual(description, "테스트  디스크립션")
    }
}
