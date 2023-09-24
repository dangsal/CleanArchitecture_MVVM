//
//  NewsViewController.swift
//  CleanArchitecture_MVVM
//
//  Created by 이성호 on 2023/09/24.
//

import UIKit

class NewsViewController: UIViewController {
    
    // MARK: - ui component
    
    private let newsView: NewsView = NewsView()
    
    // MARK: - property
    
    // MARK: - init
    
    // MARK: - life cycle
    
    override func loadView() {
        self.view = self.newsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - func
}

