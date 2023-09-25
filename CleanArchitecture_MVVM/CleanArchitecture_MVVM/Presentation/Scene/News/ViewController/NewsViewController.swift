//
//  NewsViewController.swift
//  CleanArchitecture_MVVM
//
//  Created by 이성호 on 2023/09/24.
//

import Combine
import UIKit

class NewsViewController: UIViewController {
    
    // MARK: - ui component
    
    private let newsView: NewsView = NewsView()
    
    // MARK: - property
    
    private let viewModel: NewsViewModel
    private var cancellable = Set<AnyCancellable>()
    
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
        self.bindToViewModel()
    }
    
    // MARK: - func
    
    private func bindToViewModel() {
        let output = self.transformedOutput()
        self.bindOutputToViewModel(output)
        
    }
    
    private func transformedOutput() -> NewsViewModel.Output {
        let input = NewsViewModel.Input(viewDidLoad: self.viewDidLoadPublisher)
        return self.viewModel.transform(input: input)
    }
    
    private func bindOutputToViewModel(_ output: NewsViewModel.Output) {
        output.articlePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .finished:
                    return
                case .failure:
                    self?.makeAlert(title: "네트워크 오류")
                }
            } receiveValue: { [weak self] articles in
                self?.newsView.updateArticles(articles: articles)
                self?.newsView.reloadTableView()
            }
            .store(in: &self.cancellable)

    }
}

#if DEBUG
import SwiftUI

struct PreView: PreviewProvider {
    static var previews: some View {
        let repository = NewsRepositoryImpl()
        let service = NewsService(repository: repository)
        let viewModel = NewsViewModel(newsService: service)
        let viewController = NewsViewController(viewModel: viewModel)
        viewController.toPreview()
    }
}
#endif
