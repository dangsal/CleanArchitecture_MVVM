//
//  UIViewController+Combine.swift
//  CleanArchitecture_MVVM
//
//  Created by 이성호 on 2023/09/25.
//

import Combine
import UIKit

extension UIViewController {
    var viewDidLoadPublisher: AnyPublisher<Void, Never> {
        let selector = #selector(UIViewController.viewDidLoad)
        return Just(selector)
            .map { _ in Void() }
            .eraseToAnyPublisher()
    }
}
