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
    
    private let viewModel: NewsViewModel
    
    // MARK: - init
    
    init(viewModel: NewsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - life cycle
    
    override func loadView() {
        self.view = self.newsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - func
}
