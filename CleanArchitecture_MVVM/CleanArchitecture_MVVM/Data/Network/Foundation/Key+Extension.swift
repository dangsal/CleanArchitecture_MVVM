//
//  Key+Extension.swift
//  CleanArchitecture_MVVM
//
//  Created by 이성호 on 2023/09/24.
//

import Foundation

extension Bundle {
    var developmentURL: String {
        guard let file = self.path(forResource: "Key", ofType: "plist") else { return "Key 파일이 없습니다." }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["Development URL"] as? String else { fatalError("Development URL 을 입력해주세요.") }
        return key
    }
    
    var apiKey: String {
        guard let file = self.path(forResource: "Key", ofType: "plist") else { return "Key 파일이 없습니다." }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["APIKey"] as? String else { fatalError("APIKey 을 입력해주세요.") }
        return key
    }
}
