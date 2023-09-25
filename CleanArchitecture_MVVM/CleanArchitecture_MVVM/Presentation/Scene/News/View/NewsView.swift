//
//  NewsView.swift
//  CleanArchitecture_MVVM
//
//  Created by 이성호 on 2023/09/24.
//

import UIKit

import SnapKit

final class NewsView: UIView, BaseViewType {
    
    // MARK: - ui component
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ArticleCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    // MARK: - property
    
    private var articles: [Article]?
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.baseInit()
        self.setupDelegate()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    private func setupDelegate() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupLayout() {
        self.addSubview(self.tableView)
        self.tableView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top)
            $0.leading.equalTo(self.snp.leading)
            $0.trailing.equalTo(self.snp.trailing)
            $0.bottom.equalTo(self.snp.bottom)
        }
    }
    
    func configureUI() {
        
    }
    
    func updateArticles(articles: [Article]) {
        self.articles = articles
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
}

extension NewsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let articles = self.articles else { return 0 }
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleCell else { return UITableViewCell() }
        guard let articles = self.articles else { return UITableViewCell() }
        cell.updateCell(title: articles[indexPath.row].title, description: articles[indexPath.row].description)
        return cell
    }
}

extension NewsView: UITableViewDelegate { }




#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct Preview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = NewsView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
